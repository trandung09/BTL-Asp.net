using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class ChuyenMuc
{
    public int Ma { get; set; }

    public string? Ten { get; set; }

    public string? Mota { get; set; }

    public int? MaCt { get; set; }

    public virtual ICollection<TinTuc> TinTucs { get; set; } = new List<TinTuc>();
}
