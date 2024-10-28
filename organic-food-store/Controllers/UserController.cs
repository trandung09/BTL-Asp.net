using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;
using organic_food_store.Services;

namespace organic_food_store.Controllers
{
    public class UserController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public UserController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register() // Đăng kí
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string name, string address, string phone, string email, string password)
        {
            var userFindByName = _dbContext.KhachHangs.Where(u => u.Ten == name).ToList();
            var userFindByEmail = _dbContext.KhachHangs.Where(u => u.Email == email).ToList();

            if (userFindByName.Count > 0)
            {
                ViewBag.message = "Trùng tên đăng nhập! Vui lòng nhập lại.";
            }
            else if (userFindByEmail.Count() > 0)
            {
                ViewBag.message = "Email đã được đăng kí! Vui lòng chọn một email khác.";
            }
            else
            {
                KhachHang user = new KhachHang();

                user.Ten = name;
                user.DiaChi = address;
                user.DienThoai = phone;
                user.Email = email;
                user.Password = password;

                _dbContext.KhachHangs.Add(user);
                _dbContext.SaveChanges();

                ViewBag.message = "Đăng kí tài khoản thành công.";
            }

            return View();
        }

        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(string email, string password)
        {
            var users = _dbContext.KhachHangs.Where(u => u.Email == email && u.Password == password).ToList();

            if (users.Count > 0)
            {
                // HttpContext.Session["UserName"] = users.FirstOrDefault().Ten;
                string userName = users.FirstOrDefault().Ten;
                HttpContext.Session.SetString("UserName", userName);

                RedirectToAction("Index", "Home");
            }

            ViewBag.message = "Tài khoản hoặc mật khẩu không chính xác! Vui lòng nhập lại.";

            return View();
        }

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(string recipientEmail)
        {
            var user = _dbContext.KhachHangs.Find(recipientEmail);

            if (user == null)
            {

                ViewBag.message = $"{recipientEmail} chưa được đăng kí tài khoản.";
                return View();
            }

            EmailModel mail = new EmailModel();
            mail.SenderEmail = "trandung09082004@gmail.com";
            mail.SenderEmailPassword = ""; // Cần tạo password trên Google account security
            mail.RecipientEmail = recipientEmail;
            mail.Content = $"Đây là mật khẩu của bạn, hãy giữ kín. Mật khẩu là: <b>{user.Password}</b>.";
            mail.Topic = "Cấp lại mật khẩu.";

            EmailService emailService = new EmailService();
            emailService.SendEmail(mail);

            ViewBag.message = "Hoàn thành cấp lại mật khẩu. Vui lòng kiểm tra email của bạn để nhận lại mật khẩu.";

            return View();
        }
    }
}
