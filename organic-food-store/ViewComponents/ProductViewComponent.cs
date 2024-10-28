using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;

namespace organic_food_store.ViewComponents
{
    public class ProductViewComponent : ViewComponent
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public ProductViewComponent(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            int productId4 = 4;
            int productId5 = 5;
            int productId6 = 6;
            int productId7 = 7;
            int productId9 = 9;
            int productId10 = 10;

            var listP4 = _dbContext.Sps.Where(p => p.MaLoai == productId4).ToList();
            ViewBag.listP4 = listP4;
            var listP5 = _dbContext.Sps.Where(p => p.MaLoai == productId5).ToList();
            ViewBag.listP5 = listP5;
            var listP6 = _dbContext.Sps.Where(p => p.MaLoai == productId6).ToList();
            ViewBag.listP6 = listP6;
            var listP7 = _dbContext.Sps.Where(p => p.MaLoai == productId7).ToList();
            ViewBag.listP7 = listP7;
            var listP9 = _dbContext.Sps.Where(p => p.MaLoai == productId9).ToList();
            ViewBag.listP9 = listP9;
            var listP10 = _dbContext.Sps.Where(p => p.MaLoai == productId10).ToList();
            ViewBag.listP10 = listP10;

            return View("Index");
        }
    }
}
