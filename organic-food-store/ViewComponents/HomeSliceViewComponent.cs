using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;

namespace organic_food_store.ViewComponents
{
    public class HomeSliceViewComponent : ViewComponent
    {
        private readonly OrganicFoodStoreContext _dbContext;
        public HomeSliceViewComponent(OrganicFoodStoreContext dbContext) 
        {
            this._dbContext = dbContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var products = _dbContext.Sps.OrderBy(p => p.NgayDang).Take(10).ToList();

            return View("Index", products);
        }
    }
}
