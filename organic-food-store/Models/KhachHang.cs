using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class KhachHang
{
    public int Ma { get; set; }

    public string? Ten { get; set; }

    public string? DiaChi { get; set; }

    public string? DienThoai { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public virtual ICollection<DonHang> DonHangs { get; set; } = new List<DonHang>();
}
