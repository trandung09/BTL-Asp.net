using Microsoft.AspNetCore.Mvc;

namespace organic_food_store.Controllers
{
    public class FooterController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult StoreList()
        {
            return View();
        }

        public ActionResult BuyingGuide()
        {
            return View();
        }

        public ActionResult ReturnPolicy()
        {
            return View();
        }
    }
}
