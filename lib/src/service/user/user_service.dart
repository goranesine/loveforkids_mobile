import 'package:loveforkids/src/api/authentication/authentication_api.dart';
import 'package:rxdart/rxdart.dart';


typedef Future<void> GoogleSignInCommand();
typedef Future<void> EmailAndPasswordLogInCommand(email, password);
typedef Future<void> AutomaticLogInCommand();

class UserService {
  final AuthenticationApi authenticationApi;

  UserService({this.authenticationApi});

  BehaviorSubject<User> user$ = BehaviorSubject<User>();

  Future<void> googleSignIn() async {
    try {
      var user = await authenticationApi.handleGoogleSignIn();
      user$.add(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> emailAndPasswordLogIn() async {
    try {
      var user = await authenticationApi.handleEmailAndPasswordLogIn();
      user$.add(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<void> automaticLogIn() async {
    print('automatic login in action');
    try {
      var user = await authenticationApi.handleAnonymosLogIn();
      user$.add(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void dispose() {
    user$.close();
  }
}