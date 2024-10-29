using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;

namespace organic_food_store.ViewComponents
{
    public class CategoryViewComponent : ViewComponent
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public CategoryViewComponent(OrganicFoodStoreContext dbContext)
        {
            this._dbContext = dbContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = _dbContext.LoaiSps.ToList();

            return View("Index", categories);
        }
    }
}
