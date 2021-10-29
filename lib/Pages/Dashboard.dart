import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/BedAvailable_Page.dart';
import 'package:healthyme/Pages/Login_Hospital.dart';
import 'package:healthyme/Pages/Patient_Login.dart';
import 'package:healthyme/Pages/Surgery_Page.dart';


class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

List<String> titleList = [
  "Live Bed Status",
  "Surgery Cost",
  "Hospital Login",
  "Patient Login",
];
List<String> iconList = [
  "Images/hospital-bed (1).png",
  "Images/surgery.png",
  "Images/clinic.png",
  "Images/patient.png",
];

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primarycolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.0),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('Images/Userimage.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Prathamesh Durge',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   leading: Container(
            //       width: MediaQuery.of(context).size.width / 15,
            //       child: Image.asset("Images/house.png")),
            //   title: Text(
            //     'Home',
            //     style: GoogleFonts.robotoSlab(
            //       fontSize: 17,
            //       fontWeight: FontWeight.bold,
            //       color: primarycolor,
            //     ),
            //   ),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
            // Divider(
            //   //height: 2.0,
            //   thickness: 1,
            // ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/programmer.png")),
              title: Text(
                'View Profile',
                style: GoogleFonts.robotoSlab(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primarycolor,
                ),
              ),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_) {
                //     return UserProfilePage();
                //   }),
                // );
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/call-center.png")),
              title: Text(
                'Support',
                style: GoogleFonts.robotoSlab(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primarycolor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/feedback.png")),
              title: Text(
                'Feedback',
                style: GoogleFonts.robotoSlab(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primarycolor,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
              leading: Container(
                  width: MediaQuery.of(context).size.width / 15,
                  child: Image.asset("Images/about.png")),
              title: Text(
                'About Us',
                style: GoogleFonts.robotoSlab(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: primarycolor,
                ),
              ),
              onTap: () {},
            ),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
            ListTile(
                leading: Container(
                    width: MediaQuery.of(context).size.width / 15,
                    child: Image.asset("Images/logout.png")),
                title: Text(
                  'Logout',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: primarycolor,
                  ),
                ),
                onTap: () async {}),
            Divider(
              //height: 2.0,
              thickness: 1,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Healthy-Me",
          style: appbarstyle,
        ),
        backgroundColor: primarycolor,
        elevation: 0.1,
      ),
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: new BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 90.0)),
              ),
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            //contentPadding: EdgeInsets.only(left: 20, right: 20),
            ),
      );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: .90,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BedAvailablePage()));
                      }
                      break;
                    case 1:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SurgeryPage()));
                      }
                      break;
                    case 2:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalLoginScreen()));
                      }
                      break;
                    case 3:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientLoginScreen()));
                      }
                      break;
                  }
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 7,
                          child: Image.asset(
                            iconList[index],
                          ),
                        ),
                        Text(
                          titleList[index],
                          style: GoogleFonts.robotoSlab(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primarycolor),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
}
