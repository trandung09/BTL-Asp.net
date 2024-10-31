using Azure;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using organic_food_store.Models;
using organic_food_store.Services;

namespace organic_food_store.Controllers
{
    public class CartController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        private const string Cart = "Cart"; 

        public CartController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public ActionResult Remove(int id)
        {
            var cart = GetCartItems(); // List<CartItem> cart
            var cartItem = cart.Where(p => p.Product.Ma == id).FirstOrDefault();

            if (cartItem != null)
            {
                cart.Remove(cartItem);
            }

            SaveCartSession(cart); // Cập nhật lại giỏ hàng

            return RedirectToAction(nameof(ViewCart));
        }

        public ActionResult IncreaseQuantity(int id) // Tăng số lượng sảm phẩm
        {
            var cart = GetCartItems();
            var cartItem = cart.Where(p => p.Product.Ma == id).First();

            cartItem.Quantity += 1;
            SaveCartSession(cart);

            return RedirectToAction(nameof(ViewCart));
        }

        public ActionResult ReduceQuantity(int id) // Giảm số lượng sản phẩm
        {
            var cart = GetCartItems();
            var cartItem = cart.Where(p => p.Product.Ma == id).First();

            if (cartItem.Quantity > 1)
            {
                cartItem.Quantity -= 1;
            }

            SaveCartSession(cart);

            return RedirectToAction(nameof(ViewCart));
        }

        public ActionResult ViewCart() // Xem giỏ hàng
        {
            var cart = GetCartItems();

            if (cart == null)
            {
                return Redirect(HttpContext.Request.Headers["Referer"].ToString()); // Trả về url hiện hành
            }

            return View(cart);
        }

        public ActionResult AddCartItem(int id, int quantity) // Thêm sản phẩm vào giỏ hàng
        {
            var session = HttpContext.Session;

            if (session.GetString("UserName") != null)
            {
                var cart = GetCartItems();
                var product = _dbContext.Sps.Find(id);

                CartItem cartItem = new CartItem(product, quantity);

                // Nếu sản phẩm đã có trong giỏ hàng
                if (cart.Exists(ci => ci.Product.Ma == id))
                {
                    var newProduct = cart.Where(ci => ci.Product.Ma == id).First();
                    newProduct.Quantity += quantity;
                }
                else
                {
                    cart.Add(cartItem);
                }

                // Cập nhật lại giỏ hàng trong session (HttpContext.Session.SetString(Cart, jsonCart)
                SaveCartSession(cart); 
                
                return Redirect(HttpContext.Request.Headers["Referer"].ToString()); // Trả về url hiện hành
            }

            return RedirectToAction("LogIn", "User");
        }

        public ActionResult Payment() // Thanh toán
        {
            var cart = GetCartItems();
            return View(cart);
        }

        [HttpPost]
        public ActionResult Payment(string name, string address, string phone, string email, string paymentMethod) // Thanh toán
        { 
            DonHang newOrder = new DonHang(); // Khởi tạo đơn hàng
            {
                newOrder.TenNguoiNhan = name;
                newOrder.NgayDat = DateOnly.FromDateTime(DateTime.Now);
                newOrder.DienThoai = phone;
                newOrder.Email = email;
                newOrder.DiaChi = address;
                newOrder.PhuongThucTt = paymentMethod;

                _dbContext.DonHangs.Add(newOrder);
                _dbContext.SaveChanges();
            }

            var cart = GetCartItems();  // Giỏ hàng

            foreach (var cartItem in cart) // Khởi tạo các chi tiết đơn hàng từ giỏ hàng
            {
                ChiTietDonHang newOrderDetail = new ChiTietDonHang();
                {
                    newOrderDetail.MaDh = newOrder.Ma;
                    newOrderDetail.MaSp = cartItem.Product.Ma;
                    newOrderDetail.SoLuong = cartItem.Quantity;

                    if (cartItem.Product.KhuyenMai == null)
                    {
                        newOrderDetail.DonGia = cartItem.Product.Gia;
                    }
                    else
                    {
                        decimal salePrice = Convert.ToDecimal(cartItem.Product.Gia * (100 - cartItem.Product.KhuyenMai) / 100);
                        newOrderDetail.DonGia = salePrice * cartItem.Quantity;
                    }
                }

                _dbContext.ChiTietDonHangs.Add(newOrderDetail);
                _dbContext.SaveChanges();
            }

            EmailModel emailModel = new EmailModel(); // Khởi tạo email model cho việc gửi mail
            {
                emailModel.SenderEmail = "trandung09082004@gmail.com";
                emailModel.SenderEmailPassword = "trandung";
                emailModel.RecipientEmail = email;
                
                string content = "Cảm ơn quý khách đã đặt hàng tại Good-Market <br/> Mã đơn hàng của quý khách là : <b>" + newOrder.Ma + "</b> <br> Đơn hàng của quý khách gồm : <br>";

                double totalPrice = 0.0; // số tiền phải trả (!= paypale)
                double VAT = 0.0; // Thuế
                
                foreach (var cartItem in cart)
                {
                    double itemPrice = 0.0; // Sô tiền trả của mỗi sản phẩm trong giỏ hàng
                    if (cartItem.Product.KhuyenMai == null)
                    {
                        itemPrice = cartItem.Quantity * (double)cartItem.Product.Gia;
                    }
                    else
                    {
                        double tempPrice = Convert.ToDouble(cartItem.Product.Gia * (100 - cartItem.Product.KhuyenMai) / 100);
                        itemPrice = tempPrice * cartItem.Quantity;
                    }

                    totalPrice += itemPrice;
                    content += cartItem.Product.Ten + ": " + itemPrice + "đ" + "<br>";
                }

                VAT = totalPrice / 10;

                content += "VAT: " + VAT + "<br>" + "Số tiền thanh toán: " + totalPrice + VAT + "đ";

                emailModel.Content = content;
                emailModel.Topic = "Good market: Xác nhận đơn hàng";
            }

            EmailService emailService = new EmailService();
            emailService.SendEmail(emailModel);

            return RedirectToAction(nameof(OrderSuccessful));
        }

        public ActionResult OrderSuccessful(int id) // Đăt hàng thành công
        {
            var order = _dbContext.DonHangs.SingleOrDefault(o => o.Ma == id);
            return View(order);
        }

        // Lấy ra danh sách các sản phẩm trong giỏ hàng
        private List<CartItem> GetCartItems()
        {
            var session = HttpContext.Session;
            string jsonCart = session.GetString(Cart);

            if (jsonCart != null)
            {
                return JsonConvert.DeserializeObject<List<CartItem>>(jsonCart);
            }
            return new List<CartItem>();
        }  
        
        // Xóa các sản phẩm trong giỏ hàng
        private void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(Cart);
        }

        // Cập nhật giỏ hàng 
        private void SaveCartSession(List<CartItem> cartItems)
        {
            var session = HttpContext.Session;
            string jsonCart = JsonConvert.SerializeObject(cartItems);

            session.SetString(Cart, jsonCart);
        } 
    }
}
