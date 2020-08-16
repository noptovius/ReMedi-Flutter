// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) {
  return AppointmentResponse(
    code: json['code'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Appointment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
