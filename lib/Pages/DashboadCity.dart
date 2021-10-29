import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/API.dart';

class DashBoardCity extends StatefulWidget {
  @override
  _DashBoardCityState createState() => _DashBoardCityState();
}

class _DashBoardCityState extends State<DashBoardCity> {
  //DataService dataService = new DataService();
  @override
  TextEditingController _HospitalNameController = TextEditingController();
  FlutterTts fluttertts = FlutterTts();
  final dataservice = DataService();
  var normalTotalbeds;
  var normalTotalbedsAvailabe;
  var normalTotalICUbeds;
  var normalTotaICUbedsAvailable;
  var HospitalAddress;
  var HospitalName;
  bool snipper = false;
  bool showData = false;
  _speak() async {
    await fluttertts.setLanguage("en-US");
    await fluttertts.setPitch(1);
    await fluttertts.speak("Hello, Prathmesh Right now 30 ICU Beds and 20 Normal Beds Are available in Getwell Hospital Thanks For visiting Prathmesh have Nice Day!");
  }
  _speak2() async {
    await fluttertts.setLanguage("hi-IN");
    await fluttertts.setPitch(1);
    await fluttertts.speak("नमस्ते, प्रथमेश अभी गेटवेल अस्पताल में 30 आईसीयू बिस्तर और 20 सामान्य बिस्तर उपलब्ध हैं धन्यवाद प्रथमेश आने के लिए आपका दिन शुभ हो!");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
        title: Text(
          "Healthy-Me",
          style: appbarstyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  // TextField(
                  //   controller: _HospitalNameController,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Hospital Name',
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // FlatButton(
                  //   child: Text(
                  //     'Search',
                  //     style: GoogleFonts.robotoSlab(fontSize: 20.0),
                  //   ),
                  //   color: primarycolor,
                  //   textColor: Colors.white,
                  //   onPressed: () {
                  //     _search();
                  //   },
                  // ),
                  SizedBox(
                    height: 50.0,
                  ),
                  FlatButton(
                    child: Text(
                      'Press Button to say',
                      style: GoogleFonts.robotoSlab(fontSize: 20.0),
                    ),
                    color: primarycolor,
                    textColor: Colors.white,
                    onPressed: () {
                      _speak();
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  FlatButton(
                    child: Text(
                      'Press Button to say In Hindi',
                      style: GoogleFonts.robotoSlab(fontSize: 20.0),
                    ),
                    color: primarycolor,
                    textColor: Colors.white,
                    onPressed: () {
                      _speak2();
                    },
                  ),
                  // snipper
                  //     ? CircularProgressIndicator()
                  //     : Visibility(
                  //         visible: showData,
                  //         child: Container(
                  //           height: 450,
                  //           child: ListView.builder(
                  //               itemCount: 1,
                  //               itemBuilder: (BuildContext context, int index) {
                  //                 return Column(
                  //                   children: [
                  //                     Text(
                  //                       '${HospitalName}',
                  //                       style: HospitalHeadingstyle,
                  //                     ),
                  //                     SizedBox(
                  //                       height:
                  //                           MediaQuery.of(context).size.height /
                  //                               52,
                  //                     ),
                  //                     Card(
                  //                       margin: EdgeInsets.symmetric(
                  //                           horizontal: 10.0, vertical: 5.0),
                  //                       clipBehavior: Clip.antiAlias,
                  //                       color: Colors.white,
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(10),
                  //                       ),
                  //                       elevation: 2.0,
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             horizontal: 4.0, vertical: 22.0),
                  //                         child: Row(
                  //                           children: <Widget>[
                  //                             Expanded(
                  //                               child: Container(
                  //                                 width: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width /
                  //                                     6,
                  //                                 height: MediaQuery.of(context)
                  //                                         .size
                  //                                         .height /
                  //                                     18,
                  //                                 child: Image.asset(
                  //                                   'Images/call.png',
                  //                                 ),
                  //                               ),
                  //                               // Column(
                  //                               //   children: <Widget>[
                  //                               //     Text(
                  //                               //       "Contact",
                  //                               //       style: TextStyle(
                  //                               //         color: primarycolor,
                  //                               //         fontSize: 22.0,
                  //                               //         fontWeight: FontWeight.bold,
                  //                               //       ),
                  //                               //     ),
                  //                               //     SizedBox(
                  //                               //       height: 5.0,
                  //                               //     ),
                  //                               //     Text(
                  //                               //       "52",
                  //                               //       style: TextStyle(
                  //                               //         fontSize: 20.0,
                  //                               //         color: primarycolor,
                  //                               //       ),
                  //                               //     )
                  //                               //   ],
                  //                               // ),
                  //                             ),
                  //                             Expanded(
                  //                               child: Container(
                  //                                 width: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width /
                  //                                     6,
                  //                                 height: MediaQuery.of(context)
                  //                                         .size
                  //                                         .height /
                  //                                     18,
                  //                                 child: Image.asset(
                  //                                   'Images/whatsapp.png',
                  //                                 ),
                  //                               ),
                  //                               // Column(
                  //                               //   children: <Widget>[
                  //                               //     Text(
                  //                               //       "Followers",
                  //                               //       style: TextStyle(
                  //                               //         color: primarycolor,
                  //                               //         fontSize: 22.0,
                  //                               //         fontWeight: FontWeight.bold,
                  //                               //       ),
                  //                               //     ),
                  //                               //     SizedBox(
                  //                               //       height: 5.0,
                  //                               //     ),
                  //                               //     Text(
                  //                               //       "28.5K",
                  //                               //       style: TextStyle(
                  //                               //         fontSize: 20.0,
                  //                               //         color: primarycolor,
                  //                               //       ),
                  //                               //     )
                  //                               //   ],
                  //                               // ),
                  //                             ),
                  //                             Expanded(
                  //                               child: Container(
                  //                                 width: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width /
                  //                                     6,
                  //                                 height: MediaQuery.of(context)
                  //                                         .size
                  //                                         .height /
                  //                                     18,
                  //                                 child: Image.asset(
                  //                                   'Images/gmail.png',
                  //                                 ),
                  //                               ),
                  //                               // Column(
                  //                               //   children: <Widget>[
                  //                               //     Text(
                  //                               //       "Blog",
                  //                               //       style: TextStyle(
                  //                               //         color: primarycolor,
                  //                               //         fontSize: 22.0,
                  //                               //         fontWeight: FontWeight.bold,
                  //                               //       ),
                  //                               //     ),
                  //                               //     SizedBox(
                  //                               //       height: 5.0,
                  //                               //     ),
                  //                               //     Text(
                  //                               //       "13",
                  //                               //       style: TextStyle(
                  //                               //         fontSize: 20.0,
                  //                               //         color: primarycolor,
                  //                               //       ),
                  //                               //     )
                  //                               //   ],
                  //                               // ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Material(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10.0),
                  //                         elevation: 5.0,
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(10.0),
                  //                           child: Container(
                  //                             child: Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment
                  //                                   .start,
                  //                               children: [
                  //                                   SizedBox(
                  //                                   height: 3.0,
                  //                                 ),
                  //                                 Text(
                  //                                   "Normal Bed",
                  //                                   style:subheadingstyle,
                  //                                 ),
                  //                                 SizedBox(
                  //                                   height: 10.0,
                  //                                 ),
                  //                                 Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .spaceEvenly,
                  //                                   children: [
                  //                                     Expanded(
                  //                                       child: Container(
                  //                                         width: MediaQuery.of(
                  //                                                     context)
                  //                                                 .size
                  //                                                 .width /
                  //                                             15,
                  //                                         height: MediaQuery.of(
                  //                                                     context)
                  //                                                 .size
                  //                                                 .height /
                  //                                             18,
                  //                                         child: Image.asset(
                  //                                           'Images/hospital-bed.png',
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                     Expanded(
                  //                                       child: Column(
                  //                                         crossAxisAlignment:
                  //                                             CrossAxisAlignment
                  //                                                 .start,
                  //                                         children: [
                  //                                           Row(
                  //                                             children: [
                  //                                               Column(
                  //                                                 children: [
                  //                                                   Text(
                  //                                                     "Total",
                  //                                                     style:
                  //                                                     GoogleFonts.robotoSlab(
                  //                                                       fontSize:
                  //                                                           15.0,
                  //                                                       fontWeight:
                  //                                                           FontWeight
                  //                                                               .bold,
                  //                                                     ),
                  //                                                   ),
                  //                                                   Text(
                  //                                                     '${normalTotalbeds}',
                  //                                                     style:
                  //                                                     GoogleFonts.robotoSlab(
                  //                                                       fontSize:
                  //                                                           15.0,
                  //                                                       fontWeight:
                  //                                                           FontWeight
                  //                                                               .normal,
                  //                                                     ),
                  //                                                   ),
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ],
                  //                                       ),
                  //                                     ),
                  //                                     Expanded(
                  //                                       child: Column(
                  //                                         crossAxisAlignment:
                  //                                             CrossAxisAlignment
                  //                                                 .start,
                  //                                         children: [
                  //                                           Row(
                  //                                             children: [
                  //                                               Column(
                  //                                                 children: [
                  //                                                   Text(
                  //                                                     "Available",
                  //                                                     style:
                  //                                                     GoogleFonts.robotoSlab(
                  //                                                       fontSize:
                  //                                                           15.0,
                  //                                                       fontWeight:
                  //                                                           FontWeight
                  //                                                               .bold,
                  //                                                     ),
                  //                                                   ),
                  //                                                   Text(
                  //                                                     '${normalTotalbedsAvailabe}',
                  //                                                     style:
                  //                                                     GoogleFonts.robotoSlab(
                  //                                                       fontSize:
                  //                                                           15.0,
                  //                                                       fontWeight:
                  //                                                           FontWeight
                  //                                                               .normal,
                  //                                                     ),
                  //                                                   ),
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ],
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 Divider(
                  //                                   height: 10.0,
                  //                                   thickness: 1.0,
                  //                                 ),
                  //                                 Column(
                  //                                   crossAxisAlignment:
                  //                                   CrossAxisAlignment
                  //                                       .start,
                  //                                   children: [
                  //                                     SizedBox(
                  //                                       height: 3.0,
                  //                                     ),
                  //                                     Text(
                  //                                       "ICU Bed",
                  //                                       style:subheadingstyle,
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 10.0,
                  //                                     ),
                  //                                     Row(
                  //                                       mainAxisAlignment:
                  //                                           MainAxisAlignment
                  //                                               .spaceEvenly,
                  //                                       children: [
                  //                                         Expanded(
                  //                                           child: Container(
                  //                                             width: MediaQuery.of(
                  //                                                         context)
                  //                                                     .size
                  //                                                     .width /
                  //                                                 15,
                  //                                             height: MediaQuery.of(
                  //                                                         context)
                  //                                                     .size
                  //                                                     .height /
                  //                                                 18,
                  //                                             child: Image.asset(
                  //                                               'Images/health-insurance.png',
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                         Expanded(
                  //                                           child: Column(
                  //                                             crossAxisAlignment:
                  //                                                 CrossAxisAlignment
                  //                                                     .start,
                  //                                             children: [
                  //                                               Row(
                  //                                                 children: [
                  //                                                   Column(
                  //                                                     children: [
                  //                                                       Text(
                  //                                                         "Total",
                  //                                                         style:
                  //                                                         GoogleFonts.robotoSlab(
                  //                                                           fontSize:
                  //                                                               15.0,
                  //                                                           fontWeight:
                  //                                                               FontWeight
                  //                                                                   .bold,
                  //                                                         ),
                  //                                                       ),
                  //                                                       Text(
                  //                                                         '${normalTotalICUbeds}',
                  //                                                         style:
                  //                                                         GoogleFonts.robotoSlab(
                  //                                                           fontSize:
                  //                                                               15.0,
                  //                                                           fontWeight:
                  //                                                               FontWeight
                  //                                                                   .normal,
                  //                                                         ),
                  //                                                       ),
                  //                                                     ],
                  //                                                   ),
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ),
                  //                                         Expanded(
                  //                                           child: Column(
                  //                                             crossAxisAlignment:
                  //                                                 CrossAxisAlignment
                  //                                                     .start,
                  //                                             children: [
                  //                                               Row(
                  //                                                 children: [
                  //                                                   Column(
                  //                                                     children: [
                  //                                                       Text(
                  //                                                         "Available",
                  //                                                         style:
                  //                                                         GoogleFonts.robotoSlab(
                  //                                                           fontSize:
                  //                                                               15.0,
                  //                                                           fontWeight:
                  //                                                               FontWeight
                  //                                                                   .bold,
                  //                                                         ),
                  //                                                       ),
                  //                                                       Text(
                  //                                                         '${normalTotaICUbedsAvailable}',
                  //                                                         style:
                  //                                                         GoogleFonts.robotoSlab(
                  //                                                           fontSize:
                  //                                                               15.0,
                  //                                                           fontWeight:
                  //                                                               FontWeight
                  //                                                                   .normal,
                  //                                                         ),
                  //                                                       ),
                  //                                                     ],
                  //                                                   ),
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Material(
                  //                         borderRadius:
                  //                             BorderRadius.circular(10.0),
                  //                         elevation: 5.0,
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(10.0),
                  //                           child: Container(
                  //                             width: MediaQuery.of(context)
                  //                                 .size
                  //                                 .width,
                  //                             child: Column(
                  //                               crossAxisAlignment:
                  //                               CrossAxisAlignment
                  //                                   .start,
                  //                               children: [
                  //                                 Text(
                  //                                   "Address",
                  //                                   style: subheadingstyle,
                  //                                 ),
                  //                                 SizedBox(
                  //                                   height: 5.0,
                  //                                 ),
                  //                                 Text(
                  //                                   '${HospitalAddress}',
                  //                                   style: GoogleFonts.robotoSlab(
                  //                                     fontSize: 15.0,
                  //                                     fontWeight:
                  //                                         FontWeight.normal,
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     // Padding(
                  //                     //   padding: const EdgeInsets.only(
                  //                     //       right: 8.0, left: 8.0, top: 2.0, bottom: 8.0),
                  //                     //   child: Material(
                  //                     //     borderRadius: BorderRadius.circular(10.0),
                  //                     //     elevation: 5.0,
                  //                     //     child: Container(
                  //                     //       child: Column(
                  //                     //         children: [
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Text(
                  //                     //               "Overview",
                  //                     //               style: TextStyle(
                  //                     //                   fontSize: 20.0,
                  //                     //                   fontWeight: FontWeight.bold),
                  //                     //             ),
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment: MainAxisAlignment.start,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Furnishing Status",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment: MainAxisAlignment.start,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Facing",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment:
                  //                     //               MainAxisAlignment.spaceAround,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Water Supply",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment:
                  //                     //               MainAxisAlignment.spaceAround,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Floor",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment:
                  //                     //               MainAxisAlignment.spaceAround,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Bathroom",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment:
                  //                     //               MainAxisAlignment.spaceAround,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Gated Security",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Available",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment: MainAxisAlignment.start,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Non Veg Allowed",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //           Divider(
                  //                     //             height: 5.0,
                  //                     //             thickness: 1.0,
                  //                     //           ),
                  //                     //           Padding(
                  //                     //             padding: const EdgeInsets.all(8.0),
                  //                     //             child: Row(
                  //                     //               mainAxisAlignment: MainAxisAlignment.start,
                  //                     //               children: [
                  //                     //                 Expanded(
                  //                     //                   child: Text(
                  //                     //                     "Maintenance",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //                 Expanded(
                  //                     //                   child: Text("sdas",
                  //                     //                     style: TextStyle(
                  //                     //                         fontSize: 15.0,
                  //                     //                         fontWeight: FontWeight.normal),
                  //                     //                   ),
                  //                     //                 ),
                  //                     //               ],
                  //                     //             ),
                  //                     //           ),
                  //                     //         ],
                  //                     //       ),
                  //                     //     ),
                  //                     //   ),
                  //                     // ),
                  //                     // ListTile(
                  //                     //   title: Text('ListTile'),
                  //                     //   isThreeLine: true,
                  //                     //   subtitle: Text('Secondary text\nTertiary text'),
                  //                     //   leading: Icon(Icons.label),
                  //                     //   trailing: Text('Metadata'),
                  //                     // ),
                  //                   ],
                  //                 );
                  //               }),
                  //         ),
                  //       ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _search() async {
    setState(() {
      snipper = true;
    });
    var res =
        await dataservice.getHospitalDetails(_HospitalNameController.text);
    normalTotalbeds = res[0]['hospital_Normal_total'];
    setState(() {
      normalTotalbedsAvailabe = res[0]['hospital_Normal_bed'];
      normalTotalICUbeds = res[0]['hospital_ICU_total'];
      normalTotaICUbedsAvailable = res[0]['hospital_ICU_bed'];
      HospitalAddress = res[0]['Hospital_Address'];
      HospitalName = res[0]['hospital_name'];
    });
    print("////////////////////${res}");
    print("HospitalName///////${HospitalName}");
    print("HospitalAddress///${HospitalAddress}");
    print("normalTotalbeds///${normalTotalbeds}");
    print("normalTotalbedsAvailabe///${normalTotalbedsAvailabe}");
    print("normalTotalICUbeds///${normalTotalICUbeds}");
    print("normalTotaICUbedsAvailable///${normalTotaICUbedsAvailable}");
    setState(() {
      snipper = false;
      showData = true;
    });
  }
}
