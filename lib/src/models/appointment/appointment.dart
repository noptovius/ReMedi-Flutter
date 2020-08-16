import 'package:garudahacks/src/models/appointment/appointment_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  @JsonKey(name: "temperature")
  String temperature;
  @JsonKey(name: "heartRate")
  String heartRate;
  @JsonKey(name: "bloodPressure")
  String bloodPressure;
  @JsonKey(name: "appointmentListGroups")
  List<AppointmentGroup> appointmentListGroups;

  Appointment({this.temperature, this.heartRate, this.bloodPressure, this.appointmentListGroups});

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}