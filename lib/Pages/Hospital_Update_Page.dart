import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/API/API_HospitalDetails.dart';


class HospitalUpdatePage extends StatefulWidget {
  @override
  _HospitalUpdatePageState createState() => _HospitalUpdatePageState();
}

class _HospitalUpdatePageState extends State<HospitalUpdatePage> {
  @override
  TextEditingController _HospitalNameController = TextEditingController();
  TextEditingController _HospitalCityController = TextEditingController();
  TextEditingController _HospitalICUBedController = TextEditingController();
  TextEditingController _HospitalGeneralBedController = TextEditingController();
  TextEditingController _HospitalContactNumberController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final datahospitaldetails = DataHospitalDetails();
  String? HospitalName;
  String? HospitalCity;
  String? ICUbed;
  String? Generalbed;
  String? ContactNumber;
  bool snipper = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
      ),
      body: SafeArea(
        child: snipper
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: Text(
                              ' Hospital Details',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: primarycolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _HospitalNameController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Hospital Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Hospital Name',
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: FaIcon(
                              //     FontAwesomeIcons.hospital,
                              //     color: primarycolor,
                              //   ),
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor),
                              ),
                              labelStyle: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            onChanged: (value) {
                              HospitalName = value;
                              print("HospitalName/////////${HospitalName}");
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _HospitalCityController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Hospital City';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Hospital City',
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: FaIcon(
                              //     FontAwesomeIcons.hospital,
                              //     color: primarycolor,
                              //   ),
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor),
                              ),
                              labelStyle: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            onChanged: (value) {
                              HospitalCity = value;
                              print("HospitalCity/////////${HospitalCity}");
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _HospitalICUBedController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter ICU Bed';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'ICU Bed',
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: FaIcon(
                              //     FontAwesomeIcons.hospital,
                              //     color: primarycolor,
                              //   ),
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor),
                              ),
                              labelStyle: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            onChanged: (value) {
                              ICUbed = value;
                              print("ICUbed/////////${ICUbed}");
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _HospitalGeneralBedController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter General Bed';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'General Bed',
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: FaIcon(
                              //     FontAwesomeIcons.hospital,
                              //     color: primarycolor,
                              //   ),
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor),
                              ),
                              labelStyle: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            onChanged: (value) {
                              Generalbed = value;
                              print("Generalbed/////////${Generalbed}");
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            controller: _HospitalContactNumberController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Contact Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Contact Number',
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: FaIcon(
                              //     FontAwesomeIcons.hospital,
                              //     color: primarycolor,
                              //   ),
                              // ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primarycolor),
                              ),
                              labelStyle: AppTextStyle.style(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            onChanged: (value) {
                              ContactNumber = value;
                              print("ContactNumber/////////${ContactNumber}");
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                print("HospitalName/////////${HospitalName}");
                                print("HospitalCity/////////${HospitalCity}");
                                print("ICUbed/////////${ICUbed}");
                                print("Generalbed/////////${Generalbed}");
                                print("ContactNumber/////////${ContactNumber}");
                                _UpdateHospitalDetails();
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Update',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> _UpdateHospitalDetails() async {
    setState(() {
      snipper = true;
    });
    var fetchData = await datahospitaldetails.getHospitalDetails(
        HospitalName.toString(),
        HospitalCity.toString(),
        ICUbed.toString(),
        Generalbed.toString(),
        ContactNumber.toString());
    print("/resssssssss//////////////////${fetchData}");
    var resid = fetchData["key"];
    var message = fetchData["Message"];
    if (resid == 200) {
      setState(() {
        snipper = false;
      });
      _HospitalNameController.clear();
      _HospitalCityController.clear();
      _HospitalICUBedController.clear();
      _HospitalGeneralBedController.clear();
      _HospitalContactNumberController.clear();
      Fluttertoast.showToast(
          msg: "${message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: primarycolor,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        snipper = false;
      });
      _HospitalNameController.clear();
      _HospitalCityController.clear();
      _HospitalICUBedController.clear();
      _HospitalGeneralBedController.clear();
      _HospitalContactNumberController.clear();
      Fluttertoast.showToast(
          msg: "Data Not Updated Please Try Again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: primarycolor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
