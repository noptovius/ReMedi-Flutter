import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "specialization")
  String specialization;
  @JsonKey(name: "rating")
  double rating;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "photo")
  String photo;

  Doctor({this.rating, this.name, this.address, this.specialization, this.id, this.photo});

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
