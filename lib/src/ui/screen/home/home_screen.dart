import 'package:flutter/material.dart';
import 'package:loveforkids/src/api/authentication/authentication_api.dart';
import 'package:loveforkids/src/service/user/user_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenViewModel homeScreenViewModel;

  HomeScreen(this.homeScreenViewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Love For Kids'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            user != null ? Text('Sign Up/Log In') : Text('Hello'),
            RaisedButton(
                child: Text("SignIn with Google"),
                color: Colors.red[700],
                onPressed: () {
                  Provider.of<GoogleSignInCommand>(context)();
                }),


          ],
        ),
      ),
    );
  }
}

class HomeScreenViewModel {

}
