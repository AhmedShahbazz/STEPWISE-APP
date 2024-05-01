import 'package:flutter/material.dart';
import 'package:setpwise/signup.dart';

class term extends StatefulWidget {
  static const String id = 'Termofservices';
  const term({Key? key}) : super(key: key);

  @override
  State<term> createState() => _termState();
}

class _termState extends State<term> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Container(
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
            child: Column(children: [
              Image.asset(
                'assets/images/img.png',
                height: 140,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Term Of Services',
                style: TextStyle(
                  fontFamily: 'Elsie',
                  fontSize: 44,
                  color: Color(0xff08c2b7),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Terms of Service Agreement :',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to Stepwise, a footstep tracking app designed to help you monitor your physical activity. By downloading and using Stepwise, you agree to be bound by the following terms:',
                maxLines: 10,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '1. User Conduct ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You agree to use Stepwise for lawful purposes only and to comply with all applicable laws, rules, and regulations. You will not use our app to post or share any content that is offensive, illegal, or infringes upon the rights of others. You will also not attempt to interfere with the security or operation of our app.',
                maxLines: 20,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '2. Ownership ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Stepwise and all its content, including but not limited to graphics, logos, and text, are the property of Stepwise and are protected by copyright, trademark, and other intellectual property laws. You agree not to reproduce, modify, or distribute any of our apps content without our prior written consent.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '3. Disclaimer of Warranty ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Stepwise is provided "as is" and without any warranty or guarantee, expressed or implied. We do not warrant that our app will be error-free, uninterrupted, or free from viruses or other harmful components. We do not guarantee the accuracy, completeness, or reliability of any information obtained through our app.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '4.  Limitation of Liability ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'In no event shall Stepwise be liable for any damages, including but not limited to direct, indirect, incidental, or consequential damages, arising out of or in connection with your use or inability to use our app.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '5.  Privacy Policy ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'We take the privacy of our users seriously. Please read our Privacy Policy to understand how we collect, use, and disclose your personal information.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '6.  Governing Law ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'This Terms of Service agreement shall be governed by and construed in accordance with the laws of the jurisdiction in which we operate.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '7.  Changes to Terms of Service ',
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'We reserve the right to modify this Terms of Service agreement at any time. Any changes will be posted on our app, and your continued use of Stepwise will constitute your acceptance of the            .updated terms.',
                maxLines: 30,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'aleo',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  hoverColor: Colors.transparent,
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
                    height: 50,
                    width: 278,
                    decoration: BoxDecoration(
                        color: Color(0xff00C2C2),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text('ACCEPT',
                          style: TextStyle(
                              fontFamily: 'aleo',
                              fontSize: 28,
                              color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
