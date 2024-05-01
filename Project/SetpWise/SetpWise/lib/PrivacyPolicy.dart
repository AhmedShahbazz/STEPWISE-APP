import 'package:flutter/material.dart';
import 'package:setpwise/signup.dart';

class PrivacyPolicy extends StatefulWidget {
  static const String id = 'PrivacyPolicy';

  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                '1. Information We Collect ',
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
                'We collect certain information about you when you use Stepwise. This may include your name, email address, phone number, device information, location data, and activity data.',
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
                '2. How We Use Your Information',
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
                'We use your information to provide and improve our app, to communicate with you about our app and related services, and to personalize your experience. We may also use your information for research purposes or to comply with legal obligations.',
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
                '3. Sharing of Your Information ',
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
                'We may share your information with third-party service providers who help us operate our app, process payments, or perform other functions related to our services. We may also share your information if required by law or in response to legal requests.',
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
                '4.  Security of Your Information ',
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
                'We take appropriate measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.',
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
