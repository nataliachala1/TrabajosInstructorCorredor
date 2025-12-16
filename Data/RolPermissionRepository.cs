using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class RolPermisoRepository
    {
        private static List<RolPermission> rolPermissions = new List<RolPermission>();

        public void AsignarPermiso(int rolId, int permissionId)
        {
            rolPermissions.Add(new RolPermission
            {
                RolID = rolId,
                PermissionID = permissionId
            });
        }

        public List<RolPermission> ObtenerPermisosDeRol(int rolId)
        {
            return rolPermissions.Where(x => x.RolID == rolId).ToList();
        }
    }
}
