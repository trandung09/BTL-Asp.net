using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;

namespace organic_food_store.Controllers
{
    public class BlogController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public BlogController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _Blogs()
        {
            ViewBag.listBlog = _dbContext.TinTucs.Where(b => b.TieuBieu == true && b.LoaiTin == null).ToList();

            return PartialView();
        }

        public PartialViewResult _PregnantMothersBlogs() // Tin tức dành cho mẹ bầu
        {
            ViewBag.listMotherBlog = _dbContext.TinTucs.Where(b => b.LoaiTin == "chomebau").ToList();

            return PartialView();
        }

        public PartialViewResult _DailyBlogs()
        {
            ViewBag.listDailyBlog = _dbContext.TinTucs.Where(b => b.LoaiTin == "TinTucHangNgay").ToList();

            return PartialView();
        }

        public ActionResult Search(string query)
        {
            var listResult = _dbContext.TinTucs.Where(b => b.MotaNgan.Contains(query)).ToList();
            ViewBag.resultCount = listResult.Count();

            return View(listResult);
        }

        public ActionResult BlogDetails(int id)
        {
            var blog = _dbContext.TinTucs.Find(id);
            ViewBag.otherBlogs = _dbContext.TinTucs.Where(b => b.LoaiTin == blog.LoaiTin).Take(4).ToList();

            return View(blog);
        }
    }
}
