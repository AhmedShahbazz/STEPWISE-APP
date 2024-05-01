import 'package:flutter/material.dart';
import 'login.dart';

class home extends StatefulWidget {
  static const String id = 'homeid';
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //  (0xffF4FEFF),
        body: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(
                child: Text(
                  'Stepwise',
                  style: TextStyle(
                    fontFamily: 'Elsie',
                    fontSize: 64,
                    color: Color(0xff08c2b7),
                  ),
                ),
              ),

              const SizedBox(
                height: 225,
              ),

              const SizedBox(
                height: 40,
              ), //home
              Center(
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () //
                      //home
                      {
                    setState(() {
                      isClicked = true;
                    });

                    Navigator.pushNamed(context, login.id)
                        .then((value) => setState(() {
                              isClicked = false;
                            }));
                  },


                  child: Container(
                    height: 50,
                    width: 278,
                    decoration: BoxDecoration(
                        color:
                            isClicked ? Color(0xff008686) : Color(0xff00C2C2),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text('Get Started',
                          style: TextStyle(
                              fontFamily: 'Elsie',
                              fontSize: 28,
                              color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
