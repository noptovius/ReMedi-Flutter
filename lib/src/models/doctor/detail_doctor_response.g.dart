// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailDoctorResponse _$DetailDoctorResponseFromJson(Map<String, dynamic> json) {
  return DetailDoctorResponse(
    code: json['code'] as int,
    doctor: json['data'] == null
        ? null
        : Doctor.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetailDoctorResponseToJson(
        DetailDoctorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.doctor,
    };
