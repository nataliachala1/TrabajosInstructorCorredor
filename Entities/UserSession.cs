namespace SeguridadApp.Entities
{
    public class UserSession
    {
        public int SessionID { get; set; }
        public int UserID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string IPOrigin { get; set; }
        public string SessionStatus { get; set; }
    }
}