abstract class AuthEvent {}

class LoginEvent extends AuthEvent{

  String username;
  String password;

  LoginEvent(
      this.username,
      this.password
      );

}