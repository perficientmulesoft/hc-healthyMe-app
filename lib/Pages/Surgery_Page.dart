import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/Surgery_Details_Page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SurgeryPage extends StatefulWidget {
  @override
  _SurgeryPageState createState() => _SurgeryPageState();
}

class _SurgeryPageState extends State<SurgeryPage> {
  @override
  TextEditingController _SurgeryNameController = TextEditingController();
  FlutterTts fluttertts = FlutterTts();
  final _formKey = GlobalKey<FormState>();
  bool snipper = false;
  bool showData = false;
  String? SurgeryName;
  bool ShowData = false;
  String? SpeakMessage;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  //String _text = 'Press Button and Start Speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    //WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Color(0xffDC4242),
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeat: false,
        child: FloatingActionButton(
          backgroundColor: Color(0xffDC4242),
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _SurgeryNameController,
                            style: AppTextStyle.style(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Surgery Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText:
                                  'Press Button and Start Speaking Or Type....',
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
                              SurgeryName = value;
                              print(
                                  "SurgeryName/////////${_SurgeryNameController}");
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                SurgeryName =
                                    _SurgeryNameController.text.toString();
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(builder: (_) {
                                //     return SurgeryDetails(
                                //         SurgeryName.toString());
                                //   }),
                                // );
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (_) {
                                  return SurgeryDetails(SurgeryName.toString());
                                }), (route) => route.isFirst);
                                _SurgeryNameController.clear();
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
                                          'Search',
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
                          SizedBox(
                            height: 20,
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
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool avilable = await _speech.initialize(
        onStatus: (val) {
          print('onstatus: $val');
          if (val == "done") {
            setState(() {
              _isListening = false;
              // showbutton = true;
            });
          }
        },
        onError: (val) => print('onError: $val'),
      );
      if (avilable) {
        setState(() {
          _isListening = true;
          // showbutton = false;
        });
        _speech.listen(
          onResult: (val) => setState(() {
            _SurgeryNameController.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            print("text------${_SurgeryNameController}");
          }),
        );
      } else {
        setState(() {
          _isListening = false;
          // showbutton = true;
          _speech.stop();
        });
      }
    }
  }
}
