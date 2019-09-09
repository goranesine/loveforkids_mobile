import 'package:loveforkids/src/api/authentication/authentication_api.dart';
import 'package:loveforkids/src/api/authentication/firebase_impl.dart';
import 'package:loveforkids/src/service/user/user_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...apis,
  ...services,
  ...uiConsumableProviders,
  ...commands
];

List<SingleChildCloneableWidget> apis = [
  Provider<AuthenticationApi>.value(value: FirebaseAuthenticationApi())
];

List<SingleChildCloneableWidget> services = [
  ProxyProvider<AuthenticationApi, UserService>(
    dispose: (context, userService) => userService.dispose(),
    builder: (context, authApi, userService) =>
    userService ?? UserService(authenticationApi: authApi),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) =>
    Provider
        .of<UserService>(context, listen: false)
        .user$,
  ),

];

List<SingleChildCloneableWidget> commands = [
  Provider<GoogleSignInCommand>(
    builder: (context) =>
    Provider
        .of<UserService>(context, listen: false)
        .googleSignIn,
  ),

  Provider<EmailAndPasswordLogInCommand>(
    builder: (context) =>
    Provider
        .of<UserService>(context, listen: false)
        .emailAndPasswordLogIn,
),

  Provider<AutomaticLogInCommand>(
    builder: (context) =>
    Provider
        .of<UserService>(context, listen: false)
        .automaticLogIn,
  ),
];