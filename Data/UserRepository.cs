using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class UserRepository
    {
        private static List<User> users = new List<User>();
        private static int counterId = 1;

        public User Crear(User user)
        {
            user.UserID = counterId++;
            users.Add(user);
            return user;
        }

        public User GetById(int id)
        {
            return users.FirstOrDefault(x => x.UserID == id);
        }

        public User GetByName(string name)
        {
            return users.FirstOrDefault(x => x.Username == name);
        }

        public List<User> GetAll()
        {
            return users;
        }
    }
}