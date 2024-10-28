namespace organic_food_store.Models
{
    public class CartItem
    {
        public Sp Product { get; set; }
        public int Quantity { get; set; }

        public CartItem(Sp product, int quantity)
        {
            this.Product = product;
            this.Quantity = quantity;
        }
    }
}
