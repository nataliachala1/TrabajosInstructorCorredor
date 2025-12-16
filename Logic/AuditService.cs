using SeguridadApp.Data;
using SeguridadApp.Entities;

namespace SeguridadApp.Logic
{
    public class AuditService
    {
        private readonly AuditRepository repo = new();

        public void Register(int userId, string action, string description)
        {
            repo.Register(new Audit
            {
                UserID = userId,
                Action = action,
                Description = description,
                IPOrigin = "127.0.0.1",
                Application = "SeguridadApp"
            });
        }
    }
}
