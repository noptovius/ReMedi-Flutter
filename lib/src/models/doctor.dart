import 'dart:ffi';

class Doctor {
  String name;
  String specialization;
  double rating;
  String address;

  Doctor({this.rating, this.name, this.address, this.specialization});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json["name"],
      rating: json["rating"],
      address: json["address"],
      specialization: json["specialization"],
    );
  }

  String get getName => name;

  double get getRating => rating;

  String get getAddress => address;

  String get getSpecialization => specialization;
}
