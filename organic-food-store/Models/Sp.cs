using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class Sp
{
    public int Ma { get; set; }

    public string? Ten { get; set; }

    public string? MoTa { get; set; }

    public int? MaLoai { get; set; }

    public string? AnhNho { get; set; }

    public string? Anh1 { get; set; }

    public string? Anh2 { get; set; }

    public string? Anh3 { get; set; }

    public string? Tskt { get; set; }

    public bool? TieuBieu { get; set; }

    public bool? TrangThai { get; set; }

    public bool? Xoa { get; set; }

    public string? Hang { get; set; }

    public decimal? Gia { get; set; }

    public int? KhuyenMai { get; set; }

    public DateOnly? NgayDang { get; set; }

    public string? Dvt { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual LoaiSp? MaLoaiNavigation { get; set; }
}
