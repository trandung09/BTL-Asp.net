using Microsoft.AspNetCore.Mvc;
using organic_food_store.Models;

namespace organic_food_store.Controllers
{
    public class ProductController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public ProductController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(int id)
        {
            var product = _dbContext.Sps.Find(id);

            ViewBag.pSameType = _dbContext.Sps.Where(p => p.MaLoai == product.MaLoai).Take(4).ToList();

            return View(product);
        }

        public ActionResult _Products()
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

            return PartialView();
        }

        public ActionResult StoreGrid(int id)
        {
            var product = _dbContext.Sps.Find(id);

            ViewBag.listSameProduct = _dbContext.Sps.Where(p => p.MaLoai == id).ToList();

            // Truy vấn lấy ra tên của các sản phẩm cùng loại
            var query = from productType in _dbContext.LoaiSps
                        where productType.Ma == id
                        select productType.Ten;

            ViewBag.nameProductType = query.FirstOrDefault();

            // Đếm số lượng sản phẩm theo phân loại sản phẩm
            var query1 = from pr in _dbContext.Sps
                         where pr.MaLoai == id
                         select pr.Ma;

            ViewBag.count = query1.Count();

            return View(product);
        }

        public ActionResult Search(string query)
        {
            var products = _dbContext.Sps.Where(p => p.Ten.Contains(query)).ToList();
            ViewBag.count = products.Count();

            return View(products);
        }
    }
}
