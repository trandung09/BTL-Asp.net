using organic_food_store.Models;
using System.Net;
using System.Net.Mail;

namespace organic_food_store.Services
{
    public class EmailService
    {
        public void SendEmail(EmailModel mail)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress(mail.SenderEmail);
                mailMessage.To.Add(new MailAddress(mail.RecipientEmail));
                mailMessage.Subject = mail.Topic;
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = string.Format(mail.Content);

                var smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential(mail.SenderEmail, mail.SenderEmailPassword),
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Timeout = 200000
                };

                smtpClient.Send(mailMessage);

                // Debug
                Console.WriteLine($"Gửi email thành công.");
            }
            catch (Exception ex)
            {
                // Debug
                Console.WriteLine($"Gửi email thất bại: {ex.Message}");
            }
        }
    }
}