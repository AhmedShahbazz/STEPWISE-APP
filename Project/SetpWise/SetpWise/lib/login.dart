import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:setpwise/utils.dart';
import 'signup.dart';
import 'navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class login extends StatefulWidget {
  static const String id = 'login';
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    _auth.signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    ).then((value) {
      Future.delayed(Duration(seconds: 2)).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigation()),
        );
        setState(() {
          loading = false;
        });

        utils().toastMessage('Sign In Successsfuly');
      }).catchError((error) {
        utils().toastMessage('Sign In Error');
      });
    }).catchError((error) {
      utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }




  bool _isChecked = false;
  bool isClicked = false;
  bool __isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 873.5,
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
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'aleo',
                      fontSize: 35,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    height: 190, // updated height to correct overflow
                    width: 310,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Transform.translate(
                  offset: Offset(40, -35),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.0,
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
                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 40,
                    width: 350,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          child: InkWell(
                          //  hoverColor: Colors.transparent,
                            onTap: () //
                                //home
                                {
                              setState(() {
                                isClicked = true;
                              });

                              Navigator.pushNamed(context, signup.id)
                                  .then((value) => setState(() {
                                        isClicked = false;
                                      }));
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff00C2C2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text('SignUp',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 180,
                          right: 21,
                          bottom: 0,
                          child: InkWell(
                            //hoverColor: Colors.transparent,
                            onTap: () //
                            //home
                            {
                              if (_formkey.currentState!.validate()) {

                                login();
                                setState(() {
                                  loading = true;
                                });
                              }

                            },

                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff00C2C2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: loading
                                    ? CircularProgressIndicator(
                                        strokeWidth: 5,
                                        color: Colors.white,
                                      )
                                    : Text('Login',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
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
                  height: 26,
                ),
                Center(
                  child: Text(
                    'Or Sign Up Using',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: (){
                      _auth.signInWithProvider(GoogleAuthProvider()).then((value){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => navigation()),
                        );
                      } )
                          .catchError((error) {
                        utils().toastMessage(error.toString('error'));
                      });
                    },
                    icon: Icon(
                      FontAwesomeIcons.googlePlusG,
                      color: Colors.red,
                      size: 40,
                    ),
                    label: SizedBox.shrink(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,

                      primary: Colors.grey[400], // Sets the button background color to transparent

                       // Adds a white border around the button
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
