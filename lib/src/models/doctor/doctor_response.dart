import 'package:garudahacks/src/models/doctor/doctor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorResponse {

  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  List<Doctor> data;

  DoctorResponse({this.code, this.data});

  static fromJson(Map<String, dynamic> json) => _$DoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}