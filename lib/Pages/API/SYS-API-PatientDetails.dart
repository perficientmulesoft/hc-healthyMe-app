import 'dart:convert';

import 'package:http/http.dart' as http;

class SYSDataPatientDetails {
  Future getSYSPatientDetails(
      String patientid,
      ) async {
    String FlagToSend = "3";
    final queryparameters = {
      'PatientId': patientid,
      'PatientDetailsflag': FlagToSend,
    };
    final uri = Uri.http("patientrecordsapi.us-e2.cloudhub.io",
        "/api/patient/${patientid}");
    final response = await http.get(uri);
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
}
