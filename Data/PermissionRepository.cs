using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class PermissioRepository
    {
        private static List<Permission> permissions = new List<Permission>();
        private static int counterId = 1;

        public Permission Crear(Permission permission)
        {
            permission.PermissionID = counterId++;
            permissions.Add(permission);
            return permission;
        }

        public List<Permission> ObtenerTodos()
        {
            return permissions;
        }
    }
}
