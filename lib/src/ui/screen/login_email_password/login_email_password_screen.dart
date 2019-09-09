import 'package:flutter/material.dart';
import 'package:loveforkids/src/service/user/user_service.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController passwordController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String passwordValidator(String value){
    if (value.length < 8){
      return "Password must be longer that 8 characters";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "djkowa@gmail.com"),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "********"),
                    controller: passwordController,
                    validator: passwordValidator,
                  ),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: () async {
                      if(_registerFormKey.currentState.validate())
                        Provider.of<EmailAndPasswordLogInCommand>(context)(emailInputController.text ,passwordController.text);
                    },
                  ),


                ],
              )),)
        ,
      )
      ,
    );
  }
}

