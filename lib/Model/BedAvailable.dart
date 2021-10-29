class BedAvailable {
  String? _AvailableICUBed;
  String? _HospitalName;
  String? _AvailableBed;

  BedAvailable(this._AvailableICUBed, this._HospitalName, this._AvailableBed);

  String? get AvailableBed => _AvailableBed;

  set AvailableBed(String? value) {
    _AvailableBed = value;
  }

  String? get HospitalName => _HospitalName;

  set HospitalName(String? value) {
    _HospitalName = value;
  }

  String? get AvailableICUBed => _AvailableICUBed;

  set AvailableICUBed(String? value) {
    _AvailableICUBed = value;
  }
}
