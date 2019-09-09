import 'package:flutter/material.dart';
import 'package:loveforkids/router.dart';
import 'package:loveforkids/src/service/user/user_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  SplashScreen(this.viewModel);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initLogIn();
  }

  void initLogIn() async {
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AutomaticLogInCommand>(context)()
        .then((_) => Navigator.of(context).pushNamed(RouteName.home));
  }
}

class SplashScreenViewModel {}
