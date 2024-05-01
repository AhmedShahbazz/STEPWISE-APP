import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:setpwise/login.dart';
import 'package:setpwise/utils.dart';
import 'termofservices.dart';
import 'PrivacyPolicy.dart';

class signup extends StatefulWidget {
  static const String id = 'signupid';
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fNameControler = TextEditingController();
  final lNameControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool _isChecked = false;
  bool isClicked = false;
  bool __isClicked = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 875,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffEFEFBB),
                Colors.grey,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Center(
                    child: Text(
                      'Stepwise',
                      style: TextStyle(
                        fontFamily: 'Elsie',
                        fontSize: 80,
                        color: Color(0xff08c2b7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'aleo',
                        fontSize: 35,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 310,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 310,
                      child: TextFormField(
                        controller: fNameControler,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 310,
                      child: TextFormField(
                        controller: lNameControler,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 310,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     height: 40,
                  //     width: 310,
                  //     child: TextFormField(
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         labelText: 'Re-Enter Password',
                  //         labelStyle: TextStyle(
                  //           fontSize: 20.0,
                  //           color: Colors.grey,
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Transform.translate(
                    offset: Offset(40, 15),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  _isChecked = value;
                                } else {
                                  _isChecked = false;
                                }
                              });
                            },
                            checkColor: Colors.white,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-12, 0),
                          child: Text(
                            'By Signing  up  you have to  accept  ',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 20,
                      width: 350,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 47,
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () //
                                  //home
                                  {
                                setState(() {
                                  isClicked = true;
                                });

                                Navigator.pushNamed(context, term.id)
                                    .then((value) => setState(() {
                                          isClicked = false;
                                        }));
                              },
                              child: Container(
                                child: const Center(
                                  child: Text('Term of Service',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff08c2b7)),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 141,
                            child: Text(
                              'and',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () //
                                  //home
                                  {
                                setState(() {
                                  isClicked = true;
                                });

                                Navigator.pushNamed(context, PrivacyPolicy.id)
                                    .then((value) => setState(() {
                                          isClicked = false;
                                        }));
                              },
                              child: Container(
                                child: const Center(
                                  child: Text('Privacy Policy',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff08c2b7)),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                        setState(() {
                          loading = true;
                        });
                        _auth
                            .createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                        )
                            .then((value) {
                          _auth.currentUser?.updateDisplayName(
                              fNameControler.text.toString() +
                                  " " +
                                  lNameControler.text.toString());
                          utils().toastMessage('SignUp Successfull');
                          setState(() {
                            loading = false;
                          });
                        });
                        setState(() {
                          __isClicked = true;
                        });
                        // Wait for 5 seconds before navigating to the next page
                        Future.delayed(Duration(seconds: 3)).then((_) {
                          Navigator.pushNamed(context, login.id)
                              .then((value) => setState(() {
                                    __isClicked = false;
                                  }));
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 310,
                        decoration: BoxDecoration(
                          color: Color(0xff00C2C2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: loading
                              ? CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
