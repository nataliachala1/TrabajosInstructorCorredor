using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class AuditRepository
    {
        private static List<Audit> audits = new List<Audit>();
        private static int counterId = 1;

        public void Register(Audit register)
        {
            register.AuditID = counterId++;
            audits.Add(register);
        }

        public List<Audit> GetAll()
        {
            return audits;
        }
    }
}
