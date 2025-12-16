using SeguridadApp.Data;
using SeguridadApp.Entities;

namespace SeguridadApp.Logic
{
    public class UserService
    {
        private readonly UserRepository userRepo = new();
        private readonly UserRolRepository userRolRepo = new();
        private readonly PolicyRepository policyRepo = new();

        public string CrearUsuario(string name, string password)
        {
            var policy = policyRepo.Get();

            if (!ValidarContraseña(password, policy))
                return "La contraseña no cumple las políticas";

            var user = new User
            {
                Username = name,
                Password = password,
                AuthenticationType = "SQL"
            };

            userRepo.Crear(user);
            return "Usuario creado correctamente";
        }

        private bool ValidarContraseña(string pass, PasswordPolicy poli)
        {
            if (pass.Length < poli.LengthMin) return false;
            if (pass.Length > poli.LengthMin) return false;
            if (poli.RequiresUppercase && !pass.Any(char.IsUpper)) return false;
            if (poli.RequireNumber&& !pass.Any(char.IsDigit)) return false;
            if (poli.RequireSymbols && !pass.Any(ch => !char.IsLetterOrDigit(ch))) return false;

            return true;
        }
    }
}
