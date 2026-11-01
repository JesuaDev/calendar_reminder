class AuthFormState {
  final String? userInput;
  final String? passwordInput;

  AuthFormState({this.userInput, this.passwordInput});

  AuthFormState copyWith({String? userInput, String? passwordInput}) =>
      AuthFormState(
        userInput: userInput ?? this.userInput,
        passwordInput: passwordInput ?? this.passwordInput,
      );
}
