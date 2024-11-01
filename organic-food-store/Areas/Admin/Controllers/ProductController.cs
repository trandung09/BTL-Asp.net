using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PagedList.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;
using PagedList;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public ProductController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Index(int? page = 1)
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                int pageSize = 5;
                int pageNumber = (int)((page == null) ? 1 : page); // (page ?? 1)

                var products = _dbContext.Sps.Include(p => p.MaLoaiNavigation);

                // ToPageList không là một chuẩn trong LNIQ => nó đến từ thư viện PagedList.Mvc
                // Thực hiên phân trang (Paging)
                return View(_dbContext.Sps.ToList());
            }

            return RedirectToAction("LogIn", "Admin", new {area = "Admin"});
        }

        // Phương thức này có thể được gọi từ JavaScript(AJAX)
        // để tải dữ liệu từng trang mà không cần reload lại.
        [HttpGet]
        public PartialViewResult GetPaging(int? page)
        {
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return PartialView(_dbContext.Sps.OrderBy(s => s.Ma).ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Product/Details/5
        [HttpGet]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _dbContext.Sps.Include(s => s.MaLoaiNavigation).FirstOrDefaultAsync(m => m.Ma == id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        // GET: Admin/Product/Create
        [HttpPost]
        public IActionResult Create()
        {
            // Sử dụng SlectList tạo dropdown menu
            ViewBag.MaLoai = new SelectList(_dbContext.LoaiSps, "Ma", "Ten");
            return View();
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Ma, Ten, MoTa, MaLoai, AnhNho, Anh1, Anh2, Anh3, Tskt, TieuBieu, TrangThai, Xoa, Hang, Gia, KhuyenMai, NgayDang, Dvt")] Sp product)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Add(product);
                await _dbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.MaLoai = new SelectList(_dbContext.LoaiSps, "Ma", "Ten", product.MaLoai);
            return View(product);
        }

        // GET: Admin/Product/Edit/5
        [HttpGet]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _dbContext.Sps.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            ViewBag.MaLoai = new SelectList(_dbContext.LoaiSps, "Ma", "Ten", product.MaLoai);
            return View(product);
        }

        // POST: Admin/Product/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Ma, Ten, MoTa, MaLoai, AnhNho, Anh1, Anh2, Anh3, Tskt, TieuBieu, TrangThai, Xoa, Hang, Gia, KhuyenMai , NgayDang, Dvt")] Sp product)
        {
            if (id != product.Ma)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {   // Entry(product) lấy ra trạng thái sửa đổi của sản phẩm: edit, remove...
                    // EntityState.Modified: cập nhật trạng thái của sản phẩm là sửa đổi
                    // => Thông báo cho EntityFrameword biết rằng đối tượng này đã sửa đổi
                    // và tự động cập nhật khi gọi SaveChange()
                    _dbContext.Entry(product).State = EntityState.Modified;
                    // _dbContext.Update(product);
                    await _dbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SpExists(product.Ma))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            ViewBag.MaLoai = new SelectList(_dbContext.LoaiSps, "Ma", "Ten", product.MaLoai);
            return View(product);
        }

        // GET: Admin/Product/Delete/5
        [HttpGet]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _dbContext.Sps.Include(s => s.MaLoaiNavigation).FirstOrDefaultAsync(m => m.Ma == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Admin/Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _dbContext.Sps.FindAsync(id);
            if (product != null)
            {
                _dbContext.Sps.Remove(product);
            }
            await _dbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        private bool SpExists(int id)
        {
            return _dbContext.Sps.Any(e => e.Ma == id);
        }

        [HttpGet]
        public IActionResult Search(int? page)
        {
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(_dbContext.Sps.OrderByDescending(p => p.Ma).ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        public IActionResult Search(int? page, string keyWord)
        {
            var products = _dbContext.Sps.Where(s => s.Ten.Contains(keyWord)).ToList();

            if (page == null)
            {
                page = 1;
            }

            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(products.OrderByDescending(p => p.Ma).ToPagedList(pageNumber, pageSize));
        }
    }
}
