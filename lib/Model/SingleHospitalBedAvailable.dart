class SingleHospitalBedAvailable {
  String? _HospitalName;
  String? _HospitalCity;
  String? _HospitalICUBed;
  String? _HospitalGeneralBed;

  SingleHospitalBedAvailable(this._HospitalName, this._HospitalCity,
      this._HospitalICUBed, this._HospitalGeneralBed);

  String? get HospitalGeneralBed => _HospitalGeneralBed;

  set HospitalGeneralBed(String? value) {
    _HospitalGeneralBed = value;
  }

  String? get HospitalICUBed => _HospitalICUBed;

  set HospitalICUBed(String? value) {
    _HospitalICUBed = value;
  }

  String? get HospitalCity => _HospitalCity;

  set HospitalCity(String? value) {
    _HospitalCity = value;
  }

  String? get HospitalName => _HospitalName;

  set HospitalName(String? value) {
    _HospitalName = value;
  }
}
