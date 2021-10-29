import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/Patient_Dashboard.dart';


class PatientLoginScreen extends StatefulWidget {
  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _isSecure = true;
  String? username;
  String? Password;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
        title: Text(
          "",
          style: appbarstyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primarycolor, primarycolor]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 90,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Patient Login",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(38),
                    topLeft: Radius.circular(38),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        TextFormField(
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Patient Id',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.user,
                                color: primarycolor,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: _isSecure,
                          style: AppTextStyle.style(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSecure = !_isSecure;
                                });
                              },
                              child: _isSecure
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.eye,
                                        color: primarycolor,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.eyeSlash,
                                        color: primarycolor,
                                      ),
                                    ),
                            ),
                            hintText: 'Password',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: primarycolor),
                            ),
                            labelStyle: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          onChanged: (value) {
                            Password = value;
                          },
                        ),
                        SizedBox(height: 35),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if ((username == "0001" && Password == "0001") ||
                                  (username == "0002" && Password == "0002") ||
                                  (username == "0003" && Password == "0003")) {
                                print("Inside If");
                                print("username //////////${username}");
                                print("Password //////////${Password}");
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) {
                                    return PatientDashboardPage(
                                        username.toString());
                                  }),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please Check Username Or Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: primarycolor,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [primarycolor, primarycolor],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 32),
                                      child: Text(
                                        'Login In',
                                        style: GoogleFonts.robotoSlab(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 15.0,
                                    color: primarycolor,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Image.asset(
                                "Images/logo.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
