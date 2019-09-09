abstract class AuthenticationApi {
  Future<User> handleGoogleSignIn();
  Future<User> handleEmailAndPasswordLogIn();

  Future<User> handleAnonymosLogIn();

}

abstract class User {
  String get name;
}


