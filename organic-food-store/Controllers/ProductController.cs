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

            if (product == null)
            {
                ViewBag.pSameType = _dbContext.Sps.ToList();
                product = new Sp();
            }
            else
            {
                ViewBag.pSameType = _dbContext.Sps.Where(p => p.MaLoai == product.MaLoai).Take(4).ToList();
            }
            return View(product);
        }

        public ActionResult _Products()
        {
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
