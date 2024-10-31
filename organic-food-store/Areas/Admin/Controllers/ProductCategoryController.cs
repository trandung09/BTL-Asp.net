using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;
using PagedList;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductCategoryController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public ProductCategoryController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        // GET: Admin/Category
        public async Task<IActionResult> Index(int? page)
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                if (page == null)
                {
                    page = 1;
                }
                int pageSize = 5;
                int pageNumber = (page ?? 1);

                return View(_dbContext.LoaiSps.OrderByDescending(s => s.Ma).ToPagedList(pageNumber, pageSize));
            }
            return RedirectToAction("LogIn", "Account", new {area = "Admin"});
        }

        // GET: Admin/Category/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productCayegory = await _dbContext.LoaiSps.FirstOrDefaultAsync(m => m.Ma == id);
            if (productCayegory == null)
            {
                return NotFound();
            }

            return View(productCayegory);
        }

        // GET: Admin/Category/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Ma, Ten, Mota")] LoaiSp productCategory)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Add(productCategory);
                await _dbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(productCategory);
        }

        // GET: Admin/Category/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productCategory = await _dbContext.LoaiSps.FindAsync(id);
            if (productCategory == null)
            {
                return NotFound();
            }
            return View(productCategory);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Ma, Ten, Mota")] LoaiSp loaiSp)
        {
            if (id != loaiSp.Ma)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _dbContext.Update(loaiSp);
                    await _dbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductCategoryExists(loaiSp.Ma))
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
            return View(loaiSp);
        }

        // GET: Admin/Category/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productCategory = await _dbContext.LoaiSps.FirstOrDefaultAsync(m => m.Ma == id);
            if (productCategory == null)
            {
                return NotFound();
            }

            return View(productCategory);
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var productCategory = await _dbContext.LoaiSps.FindAsync(id);
            if (productCategory != null)
            {
                _dbContext.LoaiSps.Remove(productCategory);
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

            return View(_dbContext.LoaiSps.OrderByDescending(s => s.Ma).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult Search(int? page, string keyWord)
        {
            var pcList = _dbContext.LoaiSps.Where(s => s.Ten.Contains(keyWord)).ToList();
            if (page == null)
            {
                page = 1;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);

            return View(pcList.OrderByDescending(s => s.Ma).ToPagedList(pageNumber, pageSize));
        }

        private bool ProductCategoryExists(int id)
        {
            return _dbContext.LoaiSps.Any(e => e.Ma == id);
        }
    }
}
