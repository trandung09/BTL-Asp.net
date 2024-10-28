namespace organic_food_store.Models
{
    public class EmailModel
    {
        public string SenderEmail { get; set; }
        public string SenderEmailPassword { get; set; }
        public string RecipientEmail { get; set; }
        public string Content { get; set; }
        public string Topic { get; set; }
    }
}
