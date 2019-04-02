import 'package:clinic_app/models/LoginModel.dart';
import 'package:flutter/material.dart';
import './app_constant/application_constant.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async_loader/async_loader.dart';


void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Page",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  static final login_form = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final emailField = TextFormField(
      obscureText: false,
      controller: email,
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter email";
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      controller: password,
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter password";
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            doLogin(email.value, password.value);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ));

    return Scaffold(
        body: Form(
            key: login_form,
            child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  void doLogin(var email, var password) {
    if (login_form.currentState.validate()) {

      setState(() async {
        Map<String, String> request_body = Map();
        request_body["login_id"] = "ACME0010";
        request_body["password"] = "123456";
        request_body["device_id"] = "848454545454";
        request_body["device_type"] = "android";
        request_body["latitude"] = "0.1";
        request_body["longitude"] = "0.2";
        LoginModel loginModel = await createPost(
            Application_constant.BaseURL + "login", request_body) as LoginModel;
        debugPrint(loginModel.getUserList.email);

      });
    }
  }

  Future<LoginModel> createPost(String url, Map body) async {

  return http.post(url, body: body).then((http.Response response) {
  final int statusCode = response.statusCode;

  if (statusCode < 200 || statusCode > 400 || json == null) {
  throw new Exception("Error while fetching data");
  }
  return LoginModel.fromJson(json.decode(response.body));
  });
  }


}
