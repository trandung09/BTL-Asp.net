using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;

namespace organic_food_store.ViewComponents
{
    public class BlogViewComponent : ViewComponent
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public BlogViewComponent(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var blogs = _dbContext.TinTucs.Where(b => b.TieuBieu == true && b.LoaiTin == null).ToList();

            return View("Index", blogs);
        }
    }
}
