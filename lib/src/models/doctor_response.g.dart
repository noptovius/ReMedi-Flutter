// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) {
  return DoctorResponse(
    code: json['code'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Doctor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
