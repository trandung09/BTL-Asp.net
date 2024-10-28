using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class TinTuc
{
    public int Ma { get; set; }

    public int? MaCm { get; set; }

    public string? MotaNgan { get; set; }

    public string? Mota { get; set; }

    public DateOnly? NgayDang { get; set; }

    public string? Anh { get; set; }

    public string? NguoiDang { get; set; }

    public bool? TieuBieu { get; set; }

    public string? LoaiTin { get; set; }

    public string? TieuDe { get; set; }

    public virtual ChuyenMuc? MaCmNavigation { get; set; }
}
