using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class RolRepository
    {
        private static List<Rol> rols = new List<Rol>();
        private static int counterId = 1;

        public Rol Crear(Rol rol)
        {
            rol.RolID = counterId++;
            rols.Add(rol);
            return rol;
        }

        public List<Rol> GetAll()
        {
            return rols;
        }
    }
}