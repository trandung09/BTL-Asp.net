using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using organic_food_store.Models;
using System.Security.Cryptography.Xml;

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
            var jsonCart = HttpContext.Session.GetString(Cart);

            return  View();
        }

        public ActionResult AddCartItem(int id, int quantity)
        {
            var session = HttpContext.Session;

            if (session.GetString("UserName") != null)
            {
                var product = _dbContext.Sps.Find(id);
                var cart = GetCartItems();

                CartItem cartItem = new CartItem(product, quantity);

                if (cart.Exists(ci => ci.Product.Ma == id))
                {
                    var newProduct = cart.Where(ci => ci.Product.Ma == id).FirstOrDefault();
                    newProduct.Quantity += quantity;
                }
                else
                {
                    cart.Add(cartItem);
                }

                SaveCartSession(cart); // Cập nhật lại giỏ hàng trong session

                return Redirect(HttpContext.Request.Headers["Referer"].ToString());
            }

            return RedirectToAction("LogIn", "User");
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
