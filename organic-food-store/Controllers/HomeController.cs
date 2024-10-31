using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;
using System.Diagnostics;

namespace organic_food_store.Controllers
{
    public class HomeController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public HomeController(OrganicFoodStoreContext dbContext)
        {
            this._dbContext = dbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            HttpContext.Session.Remove("UserName");

            return RedirectToAction("Index");
        }

        public PartialViewResult _Slide()
        { 
            return PartialView();
        }
    }
}
