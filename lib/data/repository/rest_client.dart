import 'package:dio/dio.dart';
import 'package:eriell/data/repository/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(ApiConstants.getUsers)
  Future<List<User>> getUsers();
}
