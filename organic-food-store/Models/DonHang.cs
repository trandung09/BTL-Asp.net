using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class DonHang
{
    public int Ma { get; set; }

    public int? MaKh { get; set; }

    public DateOnly? NgayDat { get; set; }

    public DateOnly? NgayGiao { get; set; }

    public decimal? PhiGiao { get; set; }

    public string? TenNguoiNhan { get; set; }

    public string? DiaChi { get; set; }

    public string? DienThoai { get; set; }

    public string? Email { get; set; }

    public bool? TrangThai { get; set; }

    public string? PhuongThucTt { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual KhachHang? MaKhNavigation { get; set; }
}
