// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/app_strings.dart';
import '../models/user.dart';

part 'user_web_services.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class UserWebServices {
  factory UserWebServices(Dio dio, {String baseUrl}) = _UserWebServices;

  static Dio createAndSetupDio() {
    Dio dio = Dio();

    dio..options.connectTimeout = const Duration(seconds: 20);
    dio..options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );

    return dio;
  }

  @GET('users')
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUser(@Path('id') int userId);

  @POST('users')
  Future<User> createNewUser(@Header('Authorization') String token, @Body() User newUser);

  @DELETE('users/{id}')
  Future<HttpResponse> deleteUser(@Header('Authorization') String token, @Path('id') int userId);
}
