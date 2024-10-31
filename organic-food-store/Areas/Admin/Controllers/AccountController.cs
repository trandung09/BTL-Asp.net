using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;
using organic_food_store.Services;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AccountController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public AccountController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(string name, string password)
        {
            if (ModelState.IsValid)
            {
                var admin = _dbContext.NguoiDungs.Where(a => a.TenDangNhap.Equals(name) && a.MatKhau.Equals(password)).FirstOrDefault();
                if (admin != null)
                {
                    HttpContext.Session.SetString("AdminName", admin.TenDangNhap);

                    return RedirectToAction("Index");
                }
            }

            ViewBag.message = "Tên đăng nhập hoặc mật khẩu không đúng.";

            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string fullname, string email, string username, string password, string? iamgePath)
        {
            var adminFindByUsername = _dbContext.NguoiDungs.Where(a => a.TenDangNhap.Equals(username)).ToList();
            var adminFindByEmail = _dbContext.NguoiDungs.Where(a => a.Email.Equals(email)).ToList();

            if (adminFindByUsername.Count > 0)
            {
                ViewBag.message = "Trùng tên đăng nhập.";
            }
            else if (adminFindByEmail.Count > 0)
            {
                ViewBag.message = "Email đã được đăng kí.";
            }
            else
            {
                NguoiDung newAdmin = new NguoiDung();
                {
                    newAdmin.Quyen = "admin";
                    newAdmin.Ten = fullname;
                    newAdmin.Email = email;
                    newAdmin.TenDangNhap = username;
                    newAdmin.MatKhau = password;
                    newAdmin.Anh = iamgePath;
                }

                _dbContext.NguoiDungs.Add(newAdmin);
                _dbContext.SaveChanges();

                ViewBag.message = "Đăng kí tài khoản thành công.";
            }

            return RedirectToAction("Register", "Account", new {area = "Admin"});
        }

        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(string oldPassword, string newPassword, string confirmNewPassword)
        {
            // Kiểm tra trạng thái admin hiện tại
            string adminUsername = HttpContext.Session.GetString("AdminName");
            var currAdmin = _dbContext.NguoiDungs.Where(a => a.TenDangNhap.Equals(adminUsername)).FirstOrDefault();

            if (currAdmin == null)
            {
                return RedirectToAction("LogIn", "Account", new { area = "Admin" });
            }

            if (!currAdmin.MatKhau.Equals(oldPassword))
            {
                ViewBag.message = "Mật khẩu cũ không đúng.";
            }
            else if (!newPassword.Equals(confirmNewPassword))
            {
                ViewBag.message = "Mật khẩu nhập lại không khớp.";
            }
            else if (currAdmin.MatKhau.Equals(newPassword))
            {
                ViewBag.message = "Vui lòng nhập mật khẩu khác mật khẩu cũ.";
            }
            else
            {
                currAdmin.MatKhau = newPassword;
                _dbContext.SaveChanges();

                ViewBag.message = "Đổi mật khẩu thành công.";
            }

            return View();
        }

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(string username, string recipientEmail)
        {
            var admin = _dbContext.NguoiDungs.Where(a => a.Email.Equals(recipientEmail)).FirstOrDefault();

            if (admin == null)
            {
                ViewBag.message = $"{recipientEmail} chưa được đăng kí tài khoản.";
                return View();
            }

            EmailModel mail = new EmailModel();
            {
                mail.SenderEmail = "trandung09082004@gmail.com";
                mail.SenderEmailPassword = "trandung"; // Cần tạo password trên Google account security
                mail.RecipientEmail = recipientEmail;
                mail.Content = $"Đây là mật khẩu của bạn, hãy giữ kín. Mật khẩu là: <b>{admin.MatKhau}</b>.";
                mail.Topic = "Cấp lại mật khẩu.";
            }

            EmailService emailService = new EmailService();
            emailService.SendEmail(mail);

            ViewBag.message = "Hoàn thành cấp lại mật khẩu. Vui lòng kiểm tra email của bạn để nhận lại mật khẩu.";

            return View();
        }
    }
}
