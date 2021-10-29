import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Model/BedAvailable.dart';
import 'package:healthyme/Model/SingleHospitalBedAvailable.dart';
import 'package:healthyme/Pages/API/API_BedAvailable.dart';


class HospitalDetails extends StatefulWidget {
  @override
  String hospitalnamepara;
  HospitalDetails(this.hospitalnamepara);
  _HospitalDetailsState createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  @override
  TextEditingController _HospitalNameController = TextEditingController();
  FlutterTts fluttertts = FlutterTts();
  final databeddetails = DataBedDetails();
  List<BedAvailable> AllBedAvailable = [];
  List<SingleHospitalBedAvailable> PerticularBedAvailable = [];
  var normalTotalbeds;
  var normalTotalbedsAvailabe;
  var normalTotalICUbeds;
  var normalTotaICUbedsAvailable;
  var HospitalAddress;
  var HospitalName;
  String? SpeakMessage;
  bool snipper = false;
  bool showData = false;
  String? checkid;
  String? ChoiceHospitalname;
  String? ChoiceHospitalCity;
  String? ChoiceHospitalICUBed;
  String? ChoiceHospitalNormal;
  _speak(String Message) async {
    await fluttertts.setLanguage("en-US");
    await fluttertts.setPitch(1);
    await fluttertts.speak(Message);
  }

  Widget build(BuildContext context) {
    return
       Scaffold(
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
          child: snipper
              ? Center(child: CircularProgressIndicator())
              : checkid == "2"
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'List Of Hospital In Nagpur',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primarycolor,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.7,
                              child: ListView(
                                children: [
                                  Center(
                                    child: DataTable(columns: [
                                      DataColumn(
                                          label: Expanded(
                                        child: Container(
                                          width: 30.0,
                                          child: Center(
                                            child: Text('Sr\nNo',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      )),
                                      DataColumn(
                                          label: Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text('Hospital\nName',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      )),
                                      DataColumn(
                                          label: Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text('ICU\nBed',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      )),
                                      DataColumn(
                                          label: Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text('General\nBed',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      )),
                                    ], rows: getDataRowList()),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FlatButton(
                                    child: Text(
                                      'Listen Again',
                                      style: GoogleFonts.robotoSlab(fontSize: 20.0),
                                    ),
                                    color: primarycolor,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      _speak(SpeakMessage.toString());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : checkid == "1"
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text(
                                  '${PerticularBedAvailable[0].HospitalName} Hospital',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: primarycolor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '${PerticularBedAvailable[0].HospitalCity}',
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: primarycolor,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: Center(
                                    child: DataTable(
                                      columns: [
                                        DataColumn(
                                            label: Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Text('ICU Bed',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        )),
                                        DataColumn(
                                            label: Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Text('General Bed',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        )),
                                      ],
                                      rows: <DataRow>[
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Center(
                                              child: Text(
                                                  '${PerticularBedAvailable[0].HospitalICUBed}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            )),
                                            DataCell(Center(
                                              child: Text(
                                                  '${PerticularBedAvailable[0].HospitalGeneralBed}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 80.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FlatButton(
                                        child: Text(
                                          'Listen Again',
                                          style:
                                              GoogleFonts.robotoSlab(fontSize: 20.0),
                                        ),
                                        color: primarycolor,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          _speak(SpeakMessage.toString());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      child: Image.asset("Images/logo.png", height: MediaQuery.of(context).size.height * 0.2,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                "No Record Found",
                                style: fordatanotfoundtitle1,
                              ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height / 95,
                              // ),
                              // Text(
                              //   "For This Month",
                              //   style: fordatanotfoundtitle2,
                              // ),
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
      )
    ;
  }

  DataRow getRow(int index) {
    int srNo = index + 1;
    return DataRow(cells: [
      DataCell(Center(child: Text(srNo.toString()))),
      DataCell(
          Center(child: Text(AllBedAvailable[index].HospitalName.toString()))),
      DataCell(Center(
          child: Text(AllBedAvailable[index].AvailableICUBed.toString()))),
      DataCell(
          Center(child: Text(AllBedAvailable[index].AvailableBed.toString()))),
    ]);
  }

  List<DataRow> getDataRowList() {
    List<DataRow> myTempDataRow = [];
    for (int i = 0; i < AllBedAvailable.length; i++) {
      myTempDataRow.add(getRow(i));
    }
    return myTempDataRow;
  }

  @override
  void initState() {
    _getBedDetails();
  }

  void _getBedDetails() async {
    setState(() {
      snipper = true;
    });
    DataBedDetails databeddetails = DataBedDetails();
    var fetchData = await databeddetails.getBedDetails(widget.hospitalnamepara);
    print("fetchData//////////////${fetchData}");
    var resid = fetchData["Key"];
    if (resid == 200) {
      checkid = fetchData["choice"];
      if (checkid == "2") {
        var fetchDatasd = fetchData["Data"];
        print(fetchDatasd.length);
        List<BedAvailable> tempDataFetch = [];
        for (var n in fetchDatasd) {
          BedAvailable pro = BedAvailable(
              n["AvailableICUBed"], n["HospitalName"], n["AvailableBed"]);
          tempDataFetch.add(pro);
        }
        setState(() {
          SpeakMessage = fetchData["Message"];
          print("SpeakMessage////////${SpeakMessage}");
          this.AllBedAvailable = tempDataFetch;
          print("//////AllBedAvailable/////////${AllBedAvailable.length}");
          _speak(SpeakMessage.toString());
          snipper = false;
        });
      }
      else if (checkid == "1") {
        var fetchDatasdd1 = await fetchData["Data"];
        print("fetchDatasdd1//////////${fetchDatasdd1}");
        print(fetchDatasdd1.length);
        List<SingleHospitalBedAvailable> tempDataFetch1 = [];
        for (var n in fetchDatasdd1) {
          SingleHospitalBedAvailable pro = SingleHospitalBedAvailable(
              n["Name Of Hospital"].toString(),
              n["Name Of City"].toString(),
              n["Number Of ICU Beds"].toString(),
              n["Number Of Gen Beds"].toString());
          tempDataFetch1.add(pro);
        }
        setState(() {
          SpeakMessage = fetchData["Message"];
          print("SpeakMessage////////${SpeakMessage}");
          this.PerticularBedAvailable = tempDataFetch1;
          print(
              "//////PerticularBedAvailable/////////${PerticularBedAvailable.length}");
          print("${PerticularBedAvailable[0].HospitalName}");
          print("${PerticularBedAvailable[0].HospitalCity}");
          print("${PerticularBedAvailable[0].HospitalICUBed}");
          print("${PerticularBedAvailable[0].HospitalGeneralBed}");
          _speak(SpeakMessage.toString());
          snipper = false;
        });
      }
      else if (checkid == "3") {
        setState(() {
          snipper = false;
        });
      }
    } else {
      setState(() {
        snipper = false;
      });
    }
  }
}
