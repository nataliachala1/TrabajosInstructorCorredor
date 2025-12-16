using SeguridadApp.Logic;

var userService = new UserService();
var securityService = new SecurityService();

Console.WriteLine(userService.CrearUsuario("Natalia", "ClaveSegura123*"));
Console.WriteLine(securityService.Login("Natalia", "ClaveSegura123*", "200.10.10.1"));