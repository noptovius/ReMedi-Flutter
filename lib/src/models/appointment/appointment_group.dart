import 'package:garudahacks/src/models/appointment/appointment_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_group.g.dart';

@JsonSerializable()
class AppointmentGroup {
  @JsonKey(name: "month")
  String month;
  @JsonKey(name: "specialization")
  List<AppointmentItem> appointmentItem;

  AppointmentGroup(
      {this.month,
        this.appointmentItem});

  factory AppointmentGroup.fromJson(Map<String, dynamic> json) =>
      _$AppointmentGroupFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentGroupToJson(this);
}