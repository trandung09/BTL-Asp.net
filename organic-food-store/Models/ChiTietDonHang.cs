using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class ChiTietDonHang
{
    public int MaDh { get; set; }

    public int MaSp { get; set; }

    public int? SoLuong { get; set; }

    public decimal? DonGia { get; set; }

    public virtual DonHang MaDhNavigation { get; set; } = null!;

    public virtual Sp MaSpNavigation { get; set; } = null!;
}
