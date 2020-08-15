import 'package:chopper/chopper.dart';
import 'package:garudahacks/src/models/doctor_response.dart';
import 'package:garudahacks/src/services/api_service.dart';

class DoctorRepository {
  final ApiService apiService = ApiService.create();

  Future<Response<DoctorResponse>> fetchAllDoctors() => apiService.getAllDoctor();
}