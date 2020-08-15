// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentItem _$AppointmentItemFromJson(Map<String, dynamic> json) {
  return AppointmentItem(
    id: json['id'] as int,
    isPaired: json['isPaired'] as bool,
    doctorName: json['doctorName'] as String,
    doctorSpecialization: json['doctorSpecialization'] as String,
    hospitalName: json['hospitalName'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$AppointmentItemToJson(AppointmentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isPaired': instance.isPaired,
      'doctorName': instance.doctorName,
      'doctorSpecialization': instance.doctorSpecialization,
      'hospitalName': instance.hospitalName,
      'date': instance.date,
    };
