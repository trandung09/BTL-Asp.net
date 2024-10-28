using System;
using System.Collections.Generic;

namespace organic_food_store.Models;

public partial class LoaiSp
{
    public int Ma { get; set; }

    public string? Ten { get; set; }

    public string? Mota { get; set; }

    public virtual ICollection<Sp> Sps { get; set; } = new List<Sp>();
}
