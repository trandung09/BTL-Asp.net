using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class NguoiDung
{
    public int Ma { get; set; }

    public string? Ten { get; set; }

    public bool? GioiTinh { get; set; }

    public string? DiaChi { get; set; }

    public string? DienThoai { get; set; }

    public string? Email { get; set; }

    public string? TenDangNhap { get; set; }

    public string? MatKhau { get; set; }

    public string? Anh { get; set; }

    public string? Quyen { get; set; }
}
