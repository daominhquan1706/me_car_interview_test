part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.passwordConfirm = const Password.pure(),
  });

  final FormzStatus status;
  final Username username;
  final Password password;
  final Password passwordConfirm;

  RegisterState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    Password? passwordConfirm,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }

  @override
  List<Object> get props => [status, username, password, passwordConfirm];
}
