import 'dart:convert';

import 'package:http/http.dart' as http;
class DataService{
  Future getHospitalDetails(String hospitalname)
  async {
          final queryparameters ={'hospitalname':hospitalname};
          final uri=Uri.http("hospital-sys.us-e2.cloudhub.io","/api/hospital",{'hospitalname':hospitalname});
          final response= await http.get(uri);
          print(response.body);
          var data = jsonDecode(response.body);
          return data;
  }
}

