import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loveforkids/src/api/authentication/authentication_api.dart';

class FireUser implements User {
  FirebaseUser user;

  FireUser(this.user);

  get name => user.displayName;
}

class FirebaseAuthenticationApi implements AuthenticationApi {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FireUser> handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    var authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user =
        (authResult).user;
    print("signed in google " + user.toString());
    return FireUser(user);
  }
  
  
  Future<User> handleEmailAndPasswordLogIn() async {
    FirebaseAuth.instance
    .createUserWithEmailAndPassword();

    return
  }

  @override
  Future<User> handleAnonymosLogIn() async {
    var response = await _auth.signInAnonymously();
    print("signed in anonymus " + response.user.toString());
    return FireUser(response.user);
  }
}