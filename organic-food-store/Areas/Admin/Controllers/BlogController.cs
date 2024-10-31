using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;
using PagedList;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BlogController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public BlogController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        // GET: Admin/Blog
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                var organicFoodStoreContext = _dbContext.TinTucs.Include(t => t.MaCmNavigation);
                return View(await organicFoodStoreContext.ToListAsync());
            }
            return RedirectToAction("LogIn", "Account");
        }

        // GET: Admin/Blog/Details/5
        [HttpGet]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _dbContext.TinTucs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // GET: Admin/Blog/Create
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.MaCm = new SelectList(_dbContext.ChuyenMucs, "Ma", "Ten");
            return View();
        }

        // POST: Admin/Blog/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Ma, MaCm, MotaNgan, Mota, NgayDang, Anh, NguoiDang, TieuBieu, LoaiTin, TieuDe")] TinTuc blog)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Add(blog);
                await _dbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.MaCM = new SelectList(_dbContext.ChuyenMucs, "Ma", "Ten", blog.MaCm);
            return View(blog);
        }

        // GET: Admin/Blog/Edit/5
        [HttpGet]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _dbContext.TinTucs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }
            ViewBag.MaCM = new SelectList(_dbContext.ChuyenMucs, "Ma", "Ten", blog.MaCm);
            return View(blog);
        }

        // POST: Admin/Blog/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([Bind("Ma, MaCm, MotaNgan, Mota, NgayDang, Anh, NguoiDang, TieuBieu, LoaiTin, TieuDe")] TinTuc blog)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _dbContext.Update(blog);
                    await _dbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BlogExists(blog.Ma))
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
            ViewBag.MaCM = new SelectList(_dbContext.ChuyenMucs, "Ma", "Ma", blog.MaCm);
            return View(blog);
        }

        // GET: Admin/Blog/Delete/5
        [HttpGet]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _dbContext.TinTucs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // POST: Admin/Blog/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var blog = await _dbContext.TinTucs.FindAsync(id);
            if (blog != null)
            {
                _dbContext.TinTucs.Remove(blog);
            }

            await _dbContext.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        public ActionResult Search(int? page)
        {
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);
            return View(_dbContext.TinTucs.OrderByDescending(b => b.Ma).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Search(int? page, string keyWord)
        {
            var blogs = _dbContext.TinTucs.Where(b => b.MotaNgan.Contains(keyWord)).ToList();
            ViewBag.Count = blogs.Count();
            
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(blogs.OrderByDescending(b => b.Ma).ToPagedList(pageNumber, pageSize));
        }

        private bool BlogExists(int id)
        {
            return _dbContext.TinTucs.Any(e => e.Ma == id);
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
