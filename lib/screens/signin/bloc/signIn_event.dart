abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangeEvent(
      {required this.emailValue, required this.passwordValue});
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmitEvent({required this.email, required this.password});
}
