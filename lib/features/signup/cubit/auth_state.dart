part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class UnAuthorized extends AuthState {
  @override
  List<Object> get props => [];
}

final class Authorized extends AuthState {
  final GoogleSignInAccount account;

  Authorized(this.account);

  @override
  List<Object> get props => [account];
}
