import 'package:json_annotation/json_annotation.dart';

part 'appointment_item.g.dart';

@JsonSerializable()
class AppointmentItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "isPaired")
  bool isPaired;
  @JsonKey(name: "doctorName")
  String doctorName;
  @JsonKey(name: "doctorSpecialization")
  String doctorSpecialization;
  @JsonKey(name: "hospitalName")
  String hospitalName;
  @JsonKey(name: "date")
  String date;

  AppointmentItem({this.id, this.isPaired, this.doctorName, this.doctorSpecialization, this.hospitalName, this.date});

  factory AppointmentItem.fromJson(Map<String, dynamic> json) => _$AppointmentItemFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentItemToJson(this);
}