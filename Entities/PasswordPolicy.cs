namespace SeguridadApp.Entities
{
    public class PasswordPolicy
    {
        public int PolicyID { get; set; }
        public int LengthMin { get; set; }
        public int LengthMax { get; set; }
        public bool RequiresUppercase { get; set; }
        public bool RequireNumber { get; set; }
        public bool RequireSymbols { get; set; }
        public int ExpirationDays { get; set; }
    }
}