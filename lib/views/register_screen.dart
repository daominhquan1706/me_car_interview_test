import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:me_car_interview_test/bloc/register_bloc/register_bloc.dart';
import 'package:me_car_interview_test/utils/constants.dart';
import 'package:me_car_interview_test/views/widgets/app_primary_button.dart';
import 'package:me_car_interview_test/views/widgets/app_text_h1.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterScreen());
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
              return RegisterBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              );
            },
            child: RegisterScreenForm(),
          ),
        ),
      ),
    );
  }
}

class RegisterScreenForm extends StatelessWidget {
  const RegisterScreenForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
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
          _PasswordConfirmInput(),
          SizedBox(height: 16),
          _RegisterButton(context),
          SizedBox(height: 32),
          Text.rich(TextSpan(children: [
            new TextSpan(text: 'By signing up, you agree to Photo’s '),
            new TextSpan(
              text: 'Terms of Service',
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: new TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            ),
            new TextSpan(text: ' and '),
            new TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: new TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            ),
            new TextSpan(text: '.'),
          ]))
        ],
      ),
    );
  }

  Widget _UsernameInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 32),
          child: TextField(
            key: const Key('registerForm_usernameInput_textField'),
            onChanged: (username) => context
                .read<RegisterBloc>()
                .add(RegisterUsernameChanged(username)),
            decoration: InputDecoration(
              hintText: "Username",
              enabledBorder: AppTextFieldStyle.outlineInputBorder,
              focusedBorder: AppTextFieldStyle.outlineInputBorder,
              border: AppTextFieldStyle.outlineInputBorder,
              errorText: state.username.invalid ? 'invalid username' : null,
            ),
          ),
        );
      },
    );
  }

  Widget _PasswordInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('registerForm_passwordInput_textField'),
          onChanged: (password) => context
              .read<RegisterBloc>()
              .add(RegisterPasswordChanged(password)),
          decoration: InputDecoration(
            hintText: "Password",
            enabledBorder: AppTextFieldStyle.outlineInputBorder,
            focusedBorder: AppTextFieldStyle.outlineInputBorder,
            border: AppTextFieldStyle.outlineInputBorder,
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget _PasswordConfirmInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.passwordConfirm != current.passwordConfirm,
      builder: (context, state) {
        return TextField(
          key: const Key('registerForm_passwordInput_textField'),
          onChanged: (password) => context
              .read<RegisterBloc>()
              .add(RegisterPasswordChanged(password)),
          decoration: InputDecoration(
            hintText: "Confirm Password",
            enabledBorder: AppTextFieldStyle.outlineInputBorder,
            focusedBorder: AppTextFieldStyle.outlineInputBorder,
            border: AppTextFieldStyle.outlineInputBorder,
            errorText: state.passwordConfirm.invalid
                ? 'invalid password confirm'
                : null,
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget _RegisterButton(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: AppPrimaryButton(
                  key: const Key('registerForm_continue_raisedButton'),
                  text: AppLocalizations.of(context)!.register,
                  onPressed: state.status.isValidated
                      ? () {
                          context
                              .read<RegisterBloc>()
                              .add(const RegisterSubmitted());
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
