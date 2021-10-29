class WetherResponse {
  final String cityName;

  WetherResponse(this.cityName);

  factory WetherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    return WetherResponse(cityName);
  }
}
