import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_test_api/regis.dart';

// import 'package:login_page/pages/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _passwordObscure = true;
  bool _progressBarVisibility = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
        backgroundColor: Colors.black,
        // style:TextStyle(color: Colors.black.withOpacity(0.8)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              helperText: 'Enter your email id',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              )),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            // Check if the entered email has the right format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                  ),

// password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _passwordObscure,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            helperText: 'Enter your password',
                            prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordObscure = !_passwordObscure;
                                });
                              },
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null && value.length <= 5) {
                              return 'Enter min 5 characters';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                child: Text('Forget password'),
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 59, 57, 58),
                  // onPrimary: Color.fromARGB(255, 221, 218, 218),
                  // style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            Visibility(
              visible: _progressBarVisibility,
              maintainAnimation: true,
              maintainSemantics: true,
              maintainSize: true,
              maintainState: true,
              child: CircularProgressIndicator(
                // backgroundColor: Colors.black,
                color: Colors.black,
              ),
            ),

// login button

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String username = emailController.text.trim().toString();
                    String password = passwordController.text.trim().toString();
                    FormData loginFormData = FormData.fromMap(
                        {'user_name': username, 'password': password});
                    setState(() {
                      _progressBarVisibility = !_progressBarVisibility;
                    });
                    final dio = Dio();
                    var responce = await dio.post(
                        'http://192.168.29.254/test_api/login',
                        data: loginFormData);
                    Map<String, dynamic> data = jsonDecode(responce.data);
                    if (data['status'] == 200) {
                      if (!mounted) return;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                          (route) => false);
                    } else {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(data['message'])));
                      setState(() {
                        _progressBarVisibility = false;
                      });
                    }

                    print(responce);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 59, 57, 58),
                  onPrimary: Color.fromARGB(255, 221, 218, 218),
                  // textstyle: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),

// new acc ? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont't have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   child: TextButton(
                //     child: Text('Register now'),
                //     onPressed: () {
                //       Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const Register()),
                //           (route) => false);
                //     },
                //     style: TextButton.styleFrom(
                //         primary: Color.fromARGB(255, 39, 96, 161)),
                //   ),
                // )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
