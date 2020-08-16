import 'package:garudahacks/src/models/doctor/doctor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_doctor_response.g.dart';

@JsonSerializable()
class DetailDoctorResponse {

  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  Doctor doctor;

  DetailDoctorResponse({this.code, this.doctor});

  static fromJson(Map<String, dynamic> json) => _$DetailDoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DetailDoctorResponseToJson(this);
}