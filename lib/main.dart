import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loveforkids/provider_setup.dart';
import 'package:loveforkids/router.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(LoveForKids());





class LoveForKids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        onGenerateRoute: (settings) => Router.generateRoute(settings),
        initialRoute: RouteName.splash,
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF8BC34A),
          primaryColorLight: Color(0xFFDCEDC8),
          primaryColorDark: Color(0xFF689F38),
          accentColor: Color(0xFFE040FB),
          dividerColor: Color(0xFFBDBDBD),
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF8BC34A),
          primaryColorLight: Color(0xFFDCEDC8),
          primaryColorDark: Color(0xFF689F38),
          accentColor: Color(0xFFE040FB),
          dividerColor: Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}






