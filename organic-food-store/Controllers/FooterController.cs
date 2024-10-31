using Microsoft.AspNetCore.Mvc;

namespace organic_food_store.Controllers
{
    public class FooterController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult StoreList() // Danh sách cửa hàng
        {
            return View();
        }

        public ActionResult BuyingGuide() // Hướng dẫn mua hàng
        {
            return View();
        }

        public ActionResult ReturnPolicy() // Chính sách đổi trả
        {
            return View();
        }
    }
}
