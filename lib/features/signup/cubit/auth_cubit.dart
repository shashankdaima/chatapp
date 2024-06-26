import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:chatapp/db/db.dart';
import 'package:chatapp/db/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

//Hard coding for assignment purpose only, should technically be stored in some secret or enviroment variable.
const clientId =
    "273870401288-urg80b63aas7uljtdbcrmnvoqbpgopr4.apps.googleusercontent.com";

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: clientId,
);

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnAuthorized()) {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (account == null) {
        emit(UnAuthorized());
      } else {
        if (await checkWhetherUserExists(account.email)) {
          User user = User(
              email: account.email,
              chatRooms: [ ChatRoom(id: "Default Room", messages: [])]);
          await saveUser(user.email, user);
        }
        emit(Authorized(account));
      }
    });

    _googleSignIn.signInSilently();
  }

  signOut() {
    _googleSignIn.disconnect();
  }
}
