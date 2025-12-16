namespace SeguridadApp.Entities
{
    public class User
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool UserStatus { get; set; }
        public string AuthenticationType { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? LastAccess { get; set; }
    }
}