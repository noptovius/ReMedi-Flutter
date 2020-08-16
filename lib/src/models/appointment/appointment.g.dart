// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return Appointment(
    temperature: json['temperature'] as String,
    heartRate: json['heartRate'] as String,
    bloodPressure: json['bloodPressure'] as String,
    appointmentListGroups: (json['appointmentListGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AppointmentGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'heartRate': instance.heartRate,
      'bloodPressure': instance.bloodPressure,
      'appointmentListGroups': instance.appointmentListGroups,
    };
