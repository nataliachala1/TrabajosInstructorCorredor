using SeguridadApp.Data;
using SeguridadApp.Entities;

namespace SeguridadApp.Logic
{
    public class SecurityService
    {
        private readonly UserRepository userRepo = new();
        private readonly SessionUserRepository sessionRepo = new();
        private readonly LogErrorsRepository errorRepo = new();

        public string Login(string user, string pass, string ip)
        {
            var u = userRepo.GetByName(user);

            if (u == null)
            {
                errorRepo.Registrar(new LogErrors
                {
                    ErrorType = "Usuario no existe",
                    Description= $"Intento de login para usuario {user}",
                    IPOrigin = ip
                });

                return "Usuario no encontrado";
            }

            if (u.Password != pass)
            {
                errorRepo.Registrar(new LogErrors
                {
                    UserID = u.UserID,
                    ErrorType = "Contraseña incorrecta",
                    Description = "Intento de acceso fallido",
                    IPOrigin = ip
                });

                return "Contraseña incorrecta";
            }

            u.LastAccess = DateTime.Now;
            sessionRepo.Crear(u.UserID, ip);

            return "Inicio de sesión exitoso";
        }
    }
}
