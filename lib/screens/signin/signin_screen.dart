import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/signin/bloc/signIn_bloc.dart';
import 'package:form_validation/screens/signin/bloc/signIn_event.dart';
import 'package:form_validation/screens/signin/bloc/signin_state.dart';

class SignInScreen extends StatelessWidget {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<SignInBloc, SignInState>(
          builder: ((context, state) {
            if (state is SignInErrorState) {
              return Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Container();
            }
          }),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: emailController,
          onChanged: (value) {
            BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                emailValue: emailController.text,
                passwordValue: passwordController.text));
          },
          decoration: InputDecoration(hintText: 'Email'),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: passwordController,
          onChanged: (value) {
            BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                emailValue: emailController.text,
                passwordValue: passwordController.text));
          },
          decoration: InputDecoration(hintText: 'Password'),
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
          if (state is SignInLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return MaterialButton(
              color: (state is SignInValidState) ? Colors.blue : Colors.grey,
              child: Text('SignIn'),
              onPressed: () {
                if (state is SignInValidState) {}
                BlocProvider.of<SignInBloc>(context).add(SignInSubmitEvent(
                    email: emailController.text,
                    password: passwordController.text));
              });
        }),
      ]),
    ));
  }
}
