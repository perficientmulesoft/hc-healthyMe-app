import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Model/PatientDetailsModel.dart';
import 'package:healthyme/Pages/API/API_PatientDetails.dart';


class PatientDashboardPage extends StatefulWidget {
  @override
  String patientid;
  PatientDashboardPage(this.patientid);
  _PatientDashboardPageState createState() => _PatientDashboardPageState();
}

class _PatientDashboardPageState extends State<PatientDashboardPage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showspinner = false;
  final datapatientdetails = DataPatientDetails();
  List<PatientDetailsModel> PatientDetails = [];
  String? PatientName;
  String? PatientMobileNumber;
  String? PatientGender;
  String? PatientAge;
  String? PatientCity;
  String? PatientCountry;
  String? PatientHospitalVisited;
  String? PatientConsultedDoctor;
  String? PatientSummary;
  String? PatientLastVistedDate;
  String? checkid;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
      ),
      body: showspinner
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: checkid == "1"
                  ? Column(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [primarycolor, primarycolor]),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 200.0,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('Images/Userimage.jpg'),
                                      radius: 50.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '${PatientName}',
                                      style: NameStudentProfile,
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Patient-Id:-',
                                          style: RollNoStudentProfile,
                                        ),
                                        Text(
                                          ' ${widget.patientid}',
                                          style: RollNoStudentProfile,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                          height: 450,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "City:",
                                          style: SubtitlePatientProfile,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          '${PatientCity}',
                                          style: SubdetailPatientProfile,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Age:",
                                          style: SubtitlePatientProfile,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          '${PatientAge}',
                                          style: SubdetailPatientProfile,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Gender:",
                                          style: SubtitlePatientProfile,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          '${PatientGender}',
                                          style: SubdetailPatientProfile,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Mobile Number:",
                                  style: SubtitlePatientProfile,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '${PatientMobileNumber}',
                                  style: SubdetailPatientProfile,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Country",
                                  style: SubtitlePatientProfile,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '${PatientCountry}',
                                  style: SubdetailPatientProfile,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Address:",
                                  style: SubtitlePatientProfile,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '---',
                                  style: SubdetailPatientProfile,
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                Text(
                                  "Last Visit:",
                                  style: SubtitlePatientProfile,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: primarycolor,
                                    child: CircleAvatar(
                                      radius: 18.0,
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        '${1}',
                                        style: SubdetailPatientProfile,
                                      ),
                                    ),
                                  ),
                                  trailing: Text(
                                    "${PatientLastVistedDate}",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.green, fontSize: 12),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hospital Name:- ${PatientHospitalVisited}",
                                        style: HospitalNamePatientProfile,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        'Doctor Name:-${PatientConsultedDoctor}',
                                        style: DoctornamePatientProfile,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Summary:",
                                  style: HospitalNamePatientProfile,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${PatientSummary}',
                                  style: SubdetailPatientProfile,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          Image.asset(
                            "Images/cloud-computing.png",
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 7,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Text(
                            "Patient Record Not Found",
                            style: fordatanotfoundtitle1,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 99,
                          ),
                          Text(
                            "Please Let US Know",
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                          OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    width: 5.0, color: Color(0xffDC4242)),
                              )),
                            ),
                            child: Text(
                              "Contact Us",
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
    );
  }

  @override
  void initState() {
    _getPatientDetails();
  }

  Future<void> _getPatientDetails() async {
    setState(() {
      showspinner = true;
    });
    var fetchData =
        await datapatientdetails.getPatientDetails(widget.patientid);
    print("/resssssssss//////////////////${fetchData}");
    var resid = fetchData["Key"];
    if (resid == 200) {
      var fetchDatasd = fetchData["Data"];
      checkid = fetchData["choice"];
      print(fetchDatasd.length);
      List<PatientDetailsModel> tempDataFetch = [];
      for (var n in fetchDatasd) {
        PatientDetailsModel pro = PatientDetailsModel(
            n["PatientName"],
            n["ContactNumber"],
            n["Gender"],
            n["Age"],
            n["City"],
            n["Country"],
            n["Hospitalvisited"],
            n["ConsultedDoctor"],
            n["PatientSummary"],
            n["LastvisitedDate"]);
        tempDataFetch.add(pro);
      }
      setState(() {
        this.PatientDetails = tempDataFetch;
        print("//////PatientDetails/////////${PatientDetails.length}");
        PatientName = PatientDetails[0].PatientName;
        PatientMobileNumber = PatientDetails[0].PatientMobileNumber;
        PatientGender = PatientDetails[0].PatientGender;
        PatientAge = PatientDetails[0].PatientAge;
        PatientCity = PatientDetails[0].PatientCity;
        PatientCountry = PatientDetails[0].PatientCountry;
        PatientHospitalVisited = PatientDetails[0].PatientHospitalVisited;
        PatientConsultedDoctor = PatientDetails[0].PatientConsultedDoctor;
        PatientSummary = PatientDetails[0].PatientSummary;
        PatientLastVistedDate = PatientDetails[0].PatientLastVistedDate;
        showspinner = false;
      });
    } else {
      setState(() {
        showspinner = false;
      });
    }
  }
}
