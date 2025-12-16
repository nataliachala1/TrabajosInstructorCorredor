using SeguridadApp.Entities;

namespace SeguridadApp.Data
{
    public class LogErrorsRepository
    {
        private static List<LogErrors> errors = new List<LogErrors>();
        private static int counterId = 1;

        public void Registrar(LogErrors error)
        {
            error.ErrorID = counterId++;
            errors.Add(error);
        }
    }
}
