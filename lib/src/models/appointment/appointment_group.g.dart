// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentGroup _$AppointmentGroupFromJson(Map<String, dynamic> json) {
  return AppointmentGroup(
    month: json['month'] as String,
    appointmentItem: (json['specialization'] as List)
        ?.map((e) => e == null
            ? null
            : AppointmentItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentGroupToJson(AppointmentGroup instance) =>
    <String, dynamic>{
      'month': instance.month,
      'specialization': instance.appointmentItem,
    };
