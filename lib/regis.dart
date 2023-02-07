import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:login_test_api/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(97, 56, 54, 54),
        // style:TextStyle(color: Colors.black.withOpacity(0.8)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "Enter your user name",
                style: TextStyle(color: Color.fromARGB(255, 111, 113, 117)),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Enter your registered email",
                style: TextStyle(color: Color.fromARGB(255, 111, 113, 117)),
              ),
            ),

            Padding(padding: const EdgeInsets.all(10)),

// password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    obscureText: _passwordObscure,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password, color: Colors.black),
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
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "Enter your password",
                style: TextStyle(color: Color.fromARGB(255, 111, 113, 117)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    obscureText: _passwordObscure,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.password, color: Colors.black),
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
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                "Re-enter your password",
                style: TextStyle(color: Color.fromARGB(255, 111, 113, 117)),
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('Register'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 59, 57, 58),
                  onPrimary: Color.fromARGB(255, 221, 218, 218),
                  // textstyle: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text('Login here'),

                    // Within the `FirstRoute` widget
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (route) => false);
                    },
                    style: TextButton.styleFrom(
                        primary: Color.fromARGB(255, 39, 96, 161)),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
