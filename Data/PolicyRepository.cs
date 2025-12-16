using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class PolicyRepository
    {
        private static PasswordPolicy policys = new PasswordPolicy();

        public PasswordPolicy Get()
        {
            return policys;
        }
    }
}
