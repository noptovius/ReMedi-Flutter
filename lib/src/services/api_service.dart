import 'package:chopper/chopper.dart';
import 'package:garudahacks/src/models/doctor_response.dart';
import 'package:garudahacks/src/services/converters/converter.dart';
import 'package:garudahacks/src/services/interceptors/header_interceptor.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {

  @Get(path: 'doctors')
  Future<Response<DoctorResponse>> getAllDoctor();

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: 'http://35.240.162.63/api',
        interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
        services: [
          _$ApiService(),
        ],
        converter: DataConverter(),
        errorConverter: JsonConverter());
    return _$ApiService(client);
  }
}
