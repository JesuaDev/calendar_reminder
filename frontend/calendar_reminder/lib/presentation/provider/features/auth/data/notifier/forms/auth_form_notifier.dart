import 'package:calendar_reminder/presentation/provider/features/auth/data/state/forms/auth_form_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authFormNotifier = NotifierProvider<AuthFormStateNotifier, AuthFormState>(
  AuthFormStateNotifier.new,
);

class AuthFormStateNotifier extends Notifier<AuthFormState> {
  @override
  AuthFormState build() => AuthFormState();

  void addInputUser(String userInput) {
    state = state.copyWith(userInput: userInput);
  }

  void addInputPassword(String password) {
    state = state.copyWith(passwordInput: password);
  }
}
