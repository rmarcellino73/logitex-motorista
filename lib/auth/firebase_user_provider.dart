import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LogitexAppFirebaseUser {
  LogitexAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

LogitexAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LogitexAppFirebaseUser> logitexAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LogitexAppFirebaseUser>(
      (user) {
        currentUser = LogitexAppFirebaseUser(user);
        return currentUser!;
      },
    );
