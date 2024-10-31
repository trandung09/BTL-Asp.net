using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        public PartialViewResult _Blogs() // Tin tức
        {
            ViewBag.blogs = _dbContext.TinTucs.Where(b => b.TieuBieu == true && b.LoaiTin == null).ToList();

            return PartialView();
        }

        public PartialViewResult _PregnantMothersBlogs() // Tin tức dành cho mẹ bầu
        {
            var pregnantBlogs = _dbContext.TinTucs.Where(b => b.LoaiTin.Equals("chomebau")).ToList();
            ViewBag.blogs = _dbContext.TinTucs.ToList();

            return PartialView(pregnantBlogs);
        }

        public PartialViewResult _DailyBlogs() // Tin tức hằng ngày
        {
            var dailyBlogs = _dbContext.TinTucs.Where(b => b.LoaiTin.Equals("TinTucHangNgay")).ToList();
            ViewBag.blogs = _dbContext.TinTucs.ToList();
            
            return PartialView(dailyBlogs);
        }

        public ActionResult BlogDetails(int id) // Chi tiết tin tức
        {
            var blog = _dbContext.TinTucs.Find(id);
            ViewBag.otherBlogs = _dbContext.TinTucs.Where(b => b.LoaiTin == blog.LoaiTin).Take(4).ToList();

            return View(blog);
        }

        public ActionResult Search(string keyWord) // Tìm kiếm tin tức
        {
            var resultBlogs = _dbContext.TinTucs.Where(b => b.MotaNgan.Contains(keyWord)).ToList();

            ViewBag.blogs = _dbContext.TinTucs.ToList();
            ViewBag.resultCount = resultBlogs.Count();

            return View(resultBlogs);
        }

    }
}
