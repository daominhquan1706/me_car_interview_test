import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:me_car_interview_test/bloc/login_bloc/login_bloc.dart';
import 'package:me_car_interview_test/utils/constants.dart';
import 'package:me_car_interview_test/views/widgets/app_primary_button.dart';
import 'package:me_car_interview_test/views/widgets/app_text_h1.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 23,
                height: 25,
                child: Image.asset('assets/ic_back.png'),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constant.paddingLarge),
          child: BlocProvider(
            create: (BuildContext context) {
              return LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              );
            },
            child: LoginScreenForm(),
          ),
        ),
      ),
    );
  }
}

class LoginScreenForm extends StatelessWidget {
  const LoginScreenForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextH1(AppLocalizations.of(context)!.register),
          _UsernameInput(),
          SizedBox(height: 16),
          _PasswordInput(),
          SizedBox(height: 16),
          _LoginButton(context),
        ],
      ),
    );
  }

  Widget _UsernameInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 32),
          child: TextField(
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.username,
              enabledBorder: AppTextFieldStyle.outlineInputBorder,
              focusedBorder: AppTextFieldStyle.outlineInputBorder,
              border: AppTextFieldStyle.outlineInputBorder,
              errorText: state.username.invalid
                  ? AppLocalizations.of(context)!.invalidUsername
                  : null,
            ),
          ),
        );
      },
    );
  }

  Widget _PasswordInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.password,
            enabledBorder: AppTextFieldStyle.outlineInputBorder,
            focusedBorder: AppTextFieldStyle.outlineInputBorder,
            border: AppTextFieldStyle.outlineInputBorder,
            errorText: state.password.invalid
                ? AppLocalizations.of(context)!.invalidPassword
                : null,
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget _LoginButton(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: AppPrimaryButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  text: AppLocalizations.of(context)!.login,
                  onPressed: state.status.isValidated
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
