import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/API/API_HospitalDetails.dart';
import 'package:intl/intl.dart';


class PatientDetailsUpdatePage extends StatefulWidget {
  @override
  _PatientDetailsUpdatePageState createState() =>
      _PatientDetailsUpdatePageState();
}

class _PatientDetailsUpdatePageState extends State<PatientDetailsUpdatePage> {
  @override
  final _formKey = GlobalKey<FormState>();
  final datahospitaldetails = DataHospitalDetails();
  TextEditingController _SDatetext = new TextEditingController();
  bool _value = false;
  int val = -1;
 final format = DateFormat("yyyy-MM-dd");
  bool autoValidate = false;
  bool showResetIcon = false;
  bool readOnly = false;
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;
  String? SDate;

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
  List<String> _HospitalList = [
    'Keshav Hospital',
    'Getwell Hospital',
    'SureTech Hospital',
    'City Hospital',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      height: 20,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Full Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Full Name',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.user,
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
                        PatientName = value;
                        print("PatientName/////////${PatientName}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Mobile Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Mobile Number',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.mobile,
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
                        PatientMobileNumber = value;
                        print(
                            "PatientMobileNumber/////////${PatientMobileNumber}");
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text("Male"),
                                leading: Radio(
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = 1;
                                      if(val==1)
                                        {
                                          PatientGender="male";
                                        }

                                    });
                                  },
                                  activeColor: primarycolor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text("Female"),
                                leading: Radio(
                                  value: 2,
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = 2;
                                      if(val==2)
                                      {
                                        PatientGender="Female";
                                      }
                                    });
                                  },
                                  activeColor: primarycolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Age';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Age',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons,
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
                        PatientCity = value;
                        print("PatientCity/////////${PatientCity}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient City';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient City',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.city,
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
                        PatientCity = value;
                        print("PatientCity/////////${PatientCity}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Country';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Country',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.city,
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
                        PatientCountry = value;
                        print("PatientCountry/////////${PatientCountry}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DropdownSearch<String>(
                      //searchBoxController: _texSelectClassName,
                      items: _HospitalList,
                      showClearButton: true,
                      showSearchBox: true,
                      hint: 'Select Hospital Visited',
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter Select Hospital Visited';
                        }
                      },
                      // onSaved: (String value) {
                      //   // _texSelectClassName.text =
                      //   //     value.FacultyClassName.toString();
                      // },
                      dropdownSearchDecoration: InputDecoration(
                        hintStyle: AppTextStyle.style(
                          color: Colors.black.withOpacity(0.8),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, right: 0.0, left: 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.list,
                            color: primarycolor,
                          ),
                        ),
                        //border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        setState(
                          () {
                            PatientHospitalVisited = newValue;
                            print("PatientHospitalVisited///${PatientHospitalVisited}");
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Consulted Doctor';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Consulted Doctor',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.city,
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
                        PatientConsultedDoctor = value;
                        print("PatientConsultedDoctor/////////${PatientConsultedDoctor}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      maxLines: 3,
                      style: AppTextStyle.style(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Patient Summary';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Patient Summary',
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: FaIcon(
                        //     FontAwesomeIcons.city,
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
                        PatientSummary = value;
                        print("PatientSummary/////////${PatientSummary}");
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DateTimeField(
                      format: format,
                      controller: _SDatetext,
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                      // autovalidate: autoValidate,
                      validator: (date) => date == null ? 'Invalid date' : null,
                      onChanged: (date) => setState(() {
                        var formattedDate =
                            "${value.year}-${value.month}-${value.day}";
                        changedCount++;
                        SDate = formattedDate.toString();
                        print(SDate);
                      }),
                      resetIcon: showResetIcon ? Icon(Icons.delete) : null,
                      readOnly: readOnly,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.robotoSlab(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 17,
                            color: Colors.black),
                        labelText: 'Test Date',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, right: 0.0, left: 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.calendar,
                            color: primarycolor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                         // _UpdateHospitalDetails();
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
                                  padding: const EdgeInsets.only(left: 20),
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

  // Future<void> _UpdateHospitalDetails() async {
  //   // setState(() {
  //   //   snipper = true;
  //   // });
  //   var res = await datahospitaldetails.getHospitalDetails(
  //       totalICUbed.toString(),
  //       remainingICUbed.toString(),
  //       totalnormalbed.toString(),
  //       remainingICUbed.toString()
  //   );
  //   print("/resssssssss//////////////////${res}");
  //   // normalTotalbeds = res[0]['hospital_Normal_total'];
  //   // setState(() {
  //   //   normalTotalbedsAvailabe = res[0]['hospital_Normal_bed'];
  //   //   normalTotalICUbeds = res[0]['hospital_ICU_total'];
  //   //   normalTotaICUbedsAvailable = res[0]['hospital_ICU_bed'];
  //   //   HospitalAddress = res[0]['Hospital_Address'];
  //   //   HospitalName = res[0]['hospital_name'];
  //   // });
  //   // print("////////////////////${res}");
  //   // print("HospitalName///////${HospitalName}");
  //   // print("HospitalAddress///${HospitalAddress}");
  //   // print("normalTotalbeds///${normalTotalbeds}");
  //   // print("normalTotalbedsAvailabe///${normalTotalbedsAvailabe}");
  //   // print("normalTotalICUbeds///${normalTotalICUbeds}");
  //   // print("normalTotaICUbedsAvailable///${normalTotaICUbedsAvailable}");
  //   // setState(() {
  //   //   snipper = false;
  //   //   showData = true;
  //   // });
  // }
}


