import 'package:garudahacks/src/models/appointment/appointment.dart';
import 'package:garudahacks/src/models/doctor/doctor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse {

  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "data")
  List<Appointment> data;

  AppointmentResponse({this.code, this.data});

  static fromJson(Map<String, dynamic> json) => _$AppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}