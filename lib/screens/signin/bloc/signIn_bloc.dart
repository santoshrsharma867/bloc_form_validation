import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/signin/bloc/signIn_event.dart';
import 'package:form_validation/screens/signin/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
      emit(SignInErrorState('Please enter a valid email address'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Please enter a valid password'));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
