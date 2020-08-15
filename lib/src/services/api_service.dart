import 'package:chopper/chopper.dart';
import 'package:garudahacks/src/services/converters/converter.dart';
import 'package:garudahacks/src/services/interceptors/header_interceptor.dart';

//part 'api_service.chopper.dart';
//
//@ChopperApi()
//abstract class ApiService extends ChopperService {
////  @Get(path: 'movie/popular')
////  Future<Response<MovieResponse>> getAllMovies();
//
//  static ApiService create() {
//    final client = ChopperClient(
//        baseUrl: 'https://api.themoviedb.org/3',
//        interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
//        services: [
//          _$ApiService(),
//        ],
//        converter: DataConverter(),
//        errorConverter: JsonConverter());
//    return _$ApiService(client);
//  }
//}
