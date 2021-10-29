import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Model/SurgeryDetailsModel.dart';
import 'package:healthyme/Pages/API/API_SurgeryDetails.dart';


class SurgeryDetails extends StatefulWidget {
  @override
  String Surgerynamepara;
  SurgeryDetails(this.Surgerynamepara);
  _SurgeryDetailsState createState() => _SurgeryDetailsState();
}

class _SurgeryDetailsState extends State<SurgeryDetails> {
  @override
  FlutterTts fluttertts = FlutterTts();
  final datasurgery = DataSurgeryDetails();
  List<SurgeryDetailsModel> SurgeryDetailsList = [];
  bool snipper = false;
  String? checkid;
  String? SpeakMessage;

  _speak(String Message) async {
    await fluttertts.setLanguage("en-US");
    await fluttertts.setPitch(1);
    await fluttertts.speak(Message);
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
        child: snipper
            ? Center(child: CircularProgressIndicator())
            : checkid == "1"
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            'List Of Hospital for ${SurgeryDetailsList[0].SurgeryName} And Surgery Cost',
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
                            child: Center(
                              child: DataTable(columns: [
                                DataColumn(
                                    label: Expanded(
                                  child: Container(
                                    width: 50.0,
                                    child: Center(
                                      child: Text('Sr No',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )),
                                DataColumn(
                                    label: Expanded(
                                  child: Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text('Hospital Name',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )),
                                DataColumn(
                                    label: Expanded(
                                  child: Container(
                                    width: 100.0,
                                    child: Center(
                                      child: Text('Surgery Cost',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )),
                              ], rows: getDataRowList()),
                            ),
                          ),
                          SizedBox(
                            height: 150.0,
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
    );
  }

  DataRow getRow(int index) {
    int srNo = index + 1;
    return DataRow(cells: [
      DataCell(Center(child: Text(srNo.toString()))),
      DataCell(Center(
          child:
              Text(SurgeryDetailsList[index].SurgeryHospitalname.toString()))),
      DataCell(Center(
          child: Text(SurgeryDetailsList[index].SurgeryCost.toString()))),
    ]);
  }

  List<DataRow> getDataRowList() {
    List<DataRow> myTempDataRow = [];
    for (int i = 0; i < SurgeryDetailsList.length; i++) {
      myTempDataRow.add(getRow(i));
    }
    return myTempDataRow;
  }

  @override
  void initState() {
    _getSurgeryDetails(widget.Surgerynamepara);
  }

  Future<void> _getSurgeryDetails(String? SurgeryNamee) async {
    setState(() {
      snipper = true;
    });
    var fetchData =
        await datasurgery.getSurgeryDetails(SurgeryNamee.toString());
    print("/resssssssss//////////////////${fetchData}");
    var resid = fetchData["key"];
    checkid = fetchData["choice"];
    print(resid);
    if (resid == 200) {
      var fetchDatasd = fetchData["Data"];
      print(fetchDatasd.length);
      List<SurgeryDetailsModel> tempDataFetch = [];
      for (var n in fetchDatasd) {
        SurgeryDetailsModel pro = SurgeryDetailsModel(
          n["HospitalName"],
          n["Cost-In-Rupees"],
          n["Surgery"],
        );
        tempDataFetch.add(pro);
      }
      setState(() {
        SpeakMessage = fetchData["Message"];
        print("SpeakMessage////////${SpeakMessage}");
        this.SurgeryDetailsList = tempDataFetch;
        print("//////SurgeryDetailsList/////////${SurgeryDetailsList.length}");
        _speak(SpeakMessage.toString());
        snipper = false;
      });
    } else {
      setState(() {
        snipper = false;
      });
    }
  }
}
