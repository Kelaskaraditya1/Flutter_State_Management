abstract class AuthenticationEvent{

}

class LoginEvent extends AuthenticationEvent{
  String username;
  String password;

  LoginEvent({
    required this.username,
    required this.password
  });
}

class SignupEvent extends AuthenticationEvent{

  String name;
  String email;
  String contact;
  String username;
  String password;

  SignupEvent(
      {
        required this.name,
        required this.email,
        required this.contact,
        required this.username,
        required this.password
        }
        );

}