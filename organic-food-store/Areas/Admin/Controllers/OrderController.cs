using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using organic_food_store.Models;

namespace organic_food_store.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderController : Controller
    {
        private readonly OrganicFoodStoreContext _dbContext;

        public OrderController(OrganicFoodStoreContext dbContext)
        {
            _dbContext = dbContext;
        }

        // GET: Admin/Order
        public async Task<IActionResult> Index()
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                var orders = _dbContext.DonHangs.Include(d => d.MaKhNavigation);
                return View(await orders.ToListAsync());
            }
            return RedirectToAction("LogIn", "Account");
        }

        public async Task<IActionResult> NewIndex()
        {
            if (HttpContext.Session.GetString("AdminName") != null)
            {
                var orders = _dbContext.DonHangs.Include(d => d.MaKhNavigation)
                    .Where(o => o.NgayDat.Value.Year == DateTime.Now.Year
                    && ((o.NgayDat.Value.Month == DateTime.Now.Month
                    && DateTime.Now.Day - o.NgayDat.Value.Day < 6)
                    || (o.NgayDat.Value.Month == DateTime.Now.Month - 1 
                    && 30 - o.NgayDat.Value.Day + DateTime.Now.Day < 7)) 
                    );
                return View(await orders.ToListAsync());
            }
            return RedirectToAction("LogIn", "Account");
        }

        // GET: Admin/Order/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _dbContext.DonHangs.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            return View(order);
        }

        // GET: Admin/Order/Create
        public IActionResult Create()
        {
            ViewBag.MaKH = new SelectList(_dbContext.KhachHangs, "Ma", "Ten");
            return View();
        }

        // POST: Admin/Order/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Ma, MaKh, NgayDat, NgayGiao, PhiGiao, TenNguoiNhan, DiaChi, DienThoai, Email, TrangThai, PhuongThucTt")] DonHang order)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Add(order);
                await _dbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.MaKH = new SelectList(_dbContext.KhachHangs, "Ma", "Ma", order.MaKh);
            return View(order);
        }

        // GET: Admin/Order/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _dbContext.DonHangs.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            ViewBag.MaKH = new SelectList(_dbContext.KhachHangs, "Ma", "Ten", order.MaKh);
            return View(order);
        }

        // POST: Admin/Order/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit([Bind("Ma, MaKh, NgayDat, NgayGiao, PhiGiao, TenNguoiNhan, DiaChi, DienThoai, Email, TrangThai, PhuongThucTt")] DonHang order)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _dbContext.Update(order);
                    await _dbContext.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.Ma))
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
            ViewBag.MaKH = new SelectList(_dbContext.KhachHangs, "Ma", "Ten", order.MaKh);
            return View(order);
        }

        // GET: Admin/Order/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _dbContext.DonHangs.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            return View(order);
        }

        // POST: Admin/Order/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var order = await _dbContext.DonHangs.FindAsync(id);
            if (order != null)
            {
                _dbContext.DonHangs.Remove(order);
            }

            await _dbContext.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _dbContext.DonHangs.Any(e => e.Ma == id);
        }
    }
}
