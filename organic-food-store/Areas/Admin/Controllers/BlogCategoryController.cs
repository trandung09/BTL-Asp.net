using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;
using PagedList;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BlogCategoryController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public BlogCategoryController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        // GET: Admin/BlogCategory
        public ActionResult Index()
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                var blogCategories = _dbContext.ChuyenMucs.ToList();
                return View(blogCategories);
            }
            return RedirectToAction("LogIn", "Account", new {area = "Admin"});
        }

        // GET: Admin/BlogCategory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blogCategory = await _dbContext.ChuyenMucs.FirstOrDefaultAsync(m => m.Ma == id);
            if (blogCategory == null)
            {
                return NotFound();
            }

            return View(blogCategory);
        }

        // GET: Admin/BlogCategory/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/BlogCategory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Ma, Ten, Mota, MaCt")] ChuyenMuc blogCategory)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Add(blogCategory);
                await _dbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(blogCategory);
        }

        // GET: Admin/BlogCategory/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blogCategory = await _dbContext.ChuyenMucs.FindAsync(id);
            if (blogCategory == null)
            {
                return NotFound();
            }
            ViewBag.Ma = new SelectList(_dbContext.TinTucs, "Ma", "MotaNgan", blogCategory.Ma);
            return View(blogCategory);
        }

        // POST: Admin/BlogCategory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([Bind("Ma, Ten, Mota, MaCt")] ChuyenMuc blogCategory)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _dbContext.Update(blogCategory);
                    await _dbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BlogCategoryExists(blogCategory.Ma))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index), new {area = "Admin"});
            }

            ViewBag.Ma = new SelectList(_dbContext.TinTucs, "Ma", "MotaNgan", blogCategory.Ma);
            return View(blogCategory);
        }

        // GET: Admin/BlogCategory/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blogCategory = await _dbContext.ChuyenMucs.FirstOrDefaultAsync(m => m.Ma == id);
            if (blogCategory == null)
            {
                return NotFound();
            }

            return View(blogCategory);
        }

        // POST: Admin/BlogCategory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var chuyenMuc = await _dbContext.ChuyenMucs.FindAsync(id);
            if (chuyenMuc != null)
            {
                _dbContext.ChuyenMucs.Remove(chuyenMuc);
            }

            await _dbContext.SaveChangesAsync();
            return RedirectToAction(nameof(Index), new {area = "Admin"});
        }

        public IActionResult Search(int? page)
        {
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(_dbContext.ChuyenMucs.OrderByDescending(s => s.Ma).ToPagedList(pageNumber, pageSize));
        }

        public IActionResult Search(int? page, string keyWord)
        {
            var blogs = _dbContext.ChuyenMucs.Where(b => b.Ten.Contains(keyWord)).ToList();
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(blogs.OrderByDescending(s => s.Ma).ToPagedList(pageNumber, pageSize));
        }

        private bool BlogCategoryExists(int id)
        {
            return _dbContext.ChuyenMucs.Any(e => e.Ma == id);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _dbContext.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
