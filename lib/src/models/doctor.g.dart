// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return Doctor(
    rating: (json['rating'] as num)?.toDouble(),
    name: json['name'] as String,
    address: json['address'] as String,
    specialization: json['specialization'] as String,
    id: json['id'] as int,
    photo: json['photo'] as String,
  );
}

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'rating': instance.rating,
      'address': instance.address,
      'photo': instance.photo,
    };
