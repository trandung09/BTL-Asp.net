using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
            var blogs = await _dbContext.TinTucs.Where(b => b.LoaiTin == null).ToListAsync();

            return View("Index", blogs);
        }
    }
}
