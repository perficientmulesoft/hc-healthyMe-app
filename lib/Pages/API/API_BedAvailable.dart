import 'dart:convert';

import 'package:http/http.dart' as http;

class DataBedDetails {
  Future getBedDetails(String bedavailabilitymessage) async {
    String FlagToSend = "1";
    final queryparameters = {
      'bedavailability': bedavailabilitymessage,
      "bedavailabilityflag": FlagToSend
    };
    final uri = Uri.http(
        "voicebot-exp.us-e2.cloudhub.io",
        "/api/hospitalbedavailability",
        {'bedavailability': bedavailabilitymessage, "bedavailabilityflag": FlagToSend});
    final response = await http.get(uri);
    print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
}
