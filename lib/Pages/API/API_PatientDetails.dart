import 'dart:convert';

import 'package:http/http.dart' as http;

class DataPatientDetails {
  Future getPatientDetails(
    String patientid,
  ) async {
    String FlagToSend = "2";
    final queryparameters = {
      'PatientId': patientid,
      'PatientDetailsflag': FlagToSend,
    };
    final uri = Uri.http("voicebot-exp.us-e2.cloudhub.io",
        "/api/PatientDetails", queryparameters);
    final response = await http.get(uri);
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
}
