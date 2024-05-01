import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:setpwise/splash_services.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splashScreenid';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  splashservices splashScreen = splashservices();
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.ishome(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo here
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/images/img_1.png',
                  height: 180,
                ),
              ),

              JumpingDotsProgressIndicator(
                fontSize: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
