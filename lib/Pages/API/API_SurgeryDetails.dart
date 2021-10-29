import 'dart:convert';

import 'package:http/http.dart' as http;

class DataSurgeryDetails {
  Future getSurgeryDetails(
    String SurgeryName,
  ) async {
    String FlagToSend = "4";
    final queryparameters = {
      'SurgeryName': SurgeryName,
      'Surgeryflag': FlagToSend,
    };
    final uri = Uri.http("voicebot-exp.us-e2.cloudhub.io",
        "/api/SurgeryDetails", queryparameters);
    final response = await http.get(uri);
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
}
//hc-voicebot-exp.us-e2.cloudhub.io