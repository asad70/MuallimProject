import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MuallimFirebaseUser {
  MuallimFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MuallimFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MuallimFirebaseUser> muallimFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MuallimFirebaseUser>(
        (user) => currentUser = MuallimFirebaseUser(user));
