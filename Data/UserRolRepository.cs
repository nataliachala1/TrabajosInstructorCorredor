using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class UserRolRepository
    {
        private static List<UserRol> userRols = new List<UserRol>();

        public void AsignarRol(int userId, int rolId)
        {
            userRols.Add(new UserRol
            {
                UserID = userId,
                RolID = rolId
            });
        }

        public List<UserRol> ObtenerRolesDeUsuario(int userId)
        {
            return userRols.Where(x => x.UserID == userId).ToList();
        }
    }
}
