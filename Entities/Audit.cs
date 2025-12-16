namespace SeguridadApp.Entities
{
    public class Audit
    {
        public int AuditID { get; set; }
        public int UserID { get; set; }
        public string Action { get; set; }
        public DateTime Date { get; set; }
        public string Description { get; set; }
        public string IPOrigin { get; set; }
        public string Application { get; set; }
    }
}