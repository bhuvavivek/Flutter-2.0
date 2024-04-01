import 'package:flutter/material.dart';
import 'package:journey_ii/services/functions/authentications.dart';

class SignupAndLogin extends StatefulWidget {
  const SignupAndLogin({super.key});

  @override
  State<SignupAndLogin> createState() => _SignupAndLogin();
}

class _SignupAndLogin extends State<SignupAndLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String firstname = "";
  String lastname = "";

  bool isLogin = true;

  changeIsLoginValue() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
        elevation: 1.0,
      ),
      body: Form(
          key: _formKey,
          child: Column(children: [
            if (!isLogin)
              TextFormField(
                key: const ValueKey("firstname"),
                decoration: const InputDecoration(
                    hintText: "Please Enter Your Firstname "),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Firstname is Required ";
                  }
                  return null;
                },
                onSaved: (value) => setState(() {
                  firstname = value.toString();
                }),
              ),
            if (!isLogin)
              TextFormField(
                key: const ValueKey("LastName"),
                decoration: const InputDecoration(
                    hintText: "Please Enter Your LastName "),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Lastname is required ";
                  }
                  return null;
                },
                onSaved: (value) => setState(() {
                  lastname = value.toString();
                }),
              ),
            TextFormField(
              key: const ValueKey("email"),
              decoration:
                  const InputDecoration(hintText: "Please Enter an Email"),
              validator: (String? value) {
                if (value.toString().isEmpty) {
                  return "Please Enter an Email";
                } else if (!value!.contains('@')) {
                  return "Please Enter an Valid Email";
                } else {
                  return null;
                }
              },
              onChanged: (value) => setState(() {
                email = value.toString();
              }),
            ),
            TextFormField(
              key: const ValueKey("Password"),
              decoration: const InputDecoration(
                  hintText: "Please Enter Your Password "),
              obscureText: true,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Password ";
                }
                return null;
              },
              onSaved: (value) => setState(() {
                password = value.toString();
              }),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  isLogin
                      ? Authentications.signin(email, password)
                      : Authentications.signup(
                          email, password, firstname, password);

                  _formKey.currentState!.reset();
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(" ${isLogin ? "Login" : "Signup"} "),
              ),
            ),
            TextButton(
              onPressed: () => changeIsLoginValue(),
              child: isLogin
                  ? const Text(" Don't have an account ? Signup ")
                  : const Text("already have an account ? Login"),
            )
          ])),
    );
  }
}
