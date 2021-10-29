import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthyme/Constant/size_config.dart';
import 'package:healthyme/Pages/Dashboard.dart';


class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isIntroIn = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _showNextScreen());
  }

  _showNextScreen() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashBoardPage()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    Image(
                      image: AssetImage("Images/logo.png"),
                      width: 500,
                      height: 500,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(height: 50.0),
              //       // Padding(
              //       //   padding: EdgeInsets.all(0),
              //       //   child: Image(
              //       //     image: AssetImage("Images/qisystems.png"),
              //       //     width: 50,
              //       //   ),
              //       // ),
              //       // Text(
              //       //   "Powered By Q.I. Systems",
              //       //   style: SplashsubTextStyle,
              //       // ),
              //       // Expanded(
              //       //     child: Text(
              //       //   "www.qisystems.in",
              //       //   style: splashemailTextStyle,
              //       // ))
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
