import 'dart:convert';

import 'package:http/http.dart' as http;

class DataHospitalDetails {
  Future getHospitalDetails(String HospitalName, String HospitalCity,
      String ICUbed, String Generalbed, String ContactNumber) async {
    String FlagToSend = "3";
    final queryparameters = {
      'HospitalName': HospitalName,
      "HospitalCity": HospitalCity,
      'RemainingICUBed': ICUbed,
      "RemainingNormalBed": Generalbed,
      'ContactNumber': ContactNumber,
      'hospitalDetailsflag': FlagToSend,
    };
    final uri = Uri.http("voicebot-exp.us-e2.cloudhub.io",
        "/api/hospitalDetails", queryparameters);
    final response = await http.post(uri);
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
}
