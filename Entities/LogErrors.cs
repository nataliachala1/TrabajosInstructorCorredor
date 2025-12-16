namespace SeguridadApp.Entities
{
    public class LogErrors
    {
        public int ErrorID { get; set; }
        public DateTime Date { get; set; }
        public int UserID { get; set; }
        public string ErrorType { get; set; }
        public string Description { get; set; }
        public string IPOrigin { get; set; }
    }
}