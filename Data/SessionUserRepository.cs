using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class SessionUserRepository
    {
        private static List<UserSession> sessions = new List<UserSession>();
        private static int counterId = 1;

        public UserSession Crear(int userId, string ip)
        {
            var session = new UserSession
            {
                SessionID = counterId++,
                UserID = userId,
                IPOrigin = ip,
                SessionStatus = "Activo"
            };

            sessions.Add(session);
            return session;
        }

        public void Cerrar(int sessionId)
        {
            var session = sessions.FirstOrDefault(s => s.SessionID == sessionId);
            if (session != null)
            {
                session.SessionStatus = "Cerrado";
                session.EndDate = DateTime.Now;
            }
        }
    }
}
