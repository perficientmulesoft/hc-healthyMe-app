class PatientDetailsModel {
  String? _PatientName;
  String? _PatientMobileNumber;
  String? _PatientGender;
  String? _PatientAge;
  String? _PatientCity;
  String? _PatientCountry;
  String? _PatientHospitalVisited;
  String? _PatientConsultedDoctor;
  String? _PatientSummary;
  String? _PatientLastVistedDate;

  PatientDetailsModel(
      this._PatientName,
      this._PatientMobileNumber,
      this._PatientGender,
      this._PatientAge,
      this._PatientCity,
      this._PatientCountry,
      this._PatientHospitalVisited,
      this._PatientConsultedDoctor,
      this._PatientSummary,
      this._PatientLastVistedDate);

  String? get PatientLastVistedDate => _PatientLastVistedDate;

  set PatientLastVistedDate(String? value) {
    _PatientLastVistedDate = value;
  }

  String? get PatientSummary => _PatientSummary;

  set PatientSummary(String? value) {
    _PatientSummary = value;
  }

  String? get PatientConsultedDoctor => _PatientConsultedDoctor;

  set PatientConsultedDoctor(String? value) {
    _PatientConsultedDoctor = value;
  }

  String? get PatientHospitalVisited => _PatientHospitalVisited;

  set PatientHospitalVisited(String? value) {
    _PatientHospitalVisited = value;
  }

  String? get PatientCountry => _PatientCountry;

  set PatientCountry(String? value) {
    _PatientCountry = value;
  }

  String? get PatientCity => _PatientCity;

  set PatientCity(String? value) {
    _PatientCity = value;
  }

  String? get PatientAge => _PatientAge;

  set PatientAge(String? value) {
    _PatientAge = value;
  }

  String? get PatientGender => _PatientGender;

  set PatientGender(String? value) {
    _PatientGender = value;
  }

  String? get PatientMobileNumber => _PatientMobileNumber;

  set PatientMobileNumber(String? value) {
    _PatientMobileNumber = value;
  }

  String? get PatientName => _PatientName;

  set PatientName(String? value) {
    _PatientName = value;
  }
}
