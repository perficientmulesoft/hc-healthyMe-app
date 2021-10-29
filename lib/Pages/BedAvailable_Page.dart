import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Constant/const.dart';
import 'package:healthyme/Pages/Hospital_Details.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:highlight_text/highlight_text.dart';

class BedAvailablePage extends StatefulWidget {
  @override
  _BedAvailablePageState createState() => _BedAvailablePageState();
}

class _BedAvailablePageState extends State<BedAvailablePage>
    with WidgetsBindingObserver {
  @override
  final Map<String, HighlightedWord> _highlights = {
    'hospital': HighlightedWord(
        onTap: () => print('hospital'),
        textStyle: const TextStyle(
            color: Color(0xffDC4242),
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),
    'Nagpur': HighlightedWord(
        onTap: () => print('Speech'),
        textStyle: const TextStyle(
            color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold)),
    'Text': HighlightedWord(
        onTap: () => print('Text'),
        textStyle: const TextStyle(
            color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold)),
  };
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press Button and Start Speaking';
  double _confidence = 1.0;
 // bool showbutton = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _text = 'Press Button and Start Speaking';
      //showbutton = false;
    }
  }

  // @override
  // void onResumed() {
  //   _text = 'Press Button and Start Speaking';
  //   showbutton=false;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primarycolor,
        title: Text(
          "Healthy-Me",
          style: appbarstyle,
        ),
        //title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
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
            reverse: true,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: [
                      TextHighlight(
                        text: _text,
                        words: _highlights,
                        textStyle: GoogleFonts.robotoSlab(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Visibility(
                        visible: _text=="Press Button and Start Speaking" ? false :true,
                        child: FlatButton(
                          child: Text(
                            'Search',
                            style: GoogleFonts.robotoSlab(fontSize: 20.0),
                          ),
                          color: primarycolor,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (_) {
                              return HospitalDetails(_text.toString());
                            }), (route) => route.isFirst);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
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
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            print("text------${_text}");
          }),
        );
      }
      else {
        setState(() {
          _isListening = false;
         // showbutton = true;
          _speech.stop();
        });
      }
    }
  }
}
