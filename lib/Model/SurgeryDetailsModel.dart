class SurgeryDetailsModel {
  String? _SurgeryHospitalname;
  String? _SurgeryCost;
  String? _SurgeryName;

  SurgeryDetailsModel(
      this._SurgeryHospitalname, this._SurgeryCost, this._SurgeryName);

  String? get SurgeryName => _SurgeryName;

  set SurgeryName(String? value) {
    _SurgeryName = value;
  }

  String? get SurgeryCost => _SurgeryCost;

  set SurgeryCost(String? value) {
    _SurgeryCost = value;
  }

  String? get SurgeryHospitalname => _SurgeryHospitalname;

  set SurgeryHospitalname(String? value) {
    _SurgeryHospitalname = value;
  }
}
