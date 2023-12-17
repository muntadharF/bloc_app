import 'package:bloc_app/utils/network_exceptions.dart';
import 'package:bloc_app/utils/network_handler.dart';
import 'package:retrofit/dio.dart';

import '../../constants/app_strings.dart';
import '../models/user.dart';
import '../web_services/user_web_services.dart';

class UserRepository {
  final UserWebServices userWebServices;

  UserRepository({required this.userWebServices});

  Future<NetworkHandler<List<User>>> getAllUsers() async {
    try {
      List<User> response = await userWebServices.getAllUsers();
      return NetworkHandler.success(response);
    } catch (error) {
      return NetworkHandler.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<User> getUser(int userId) async {
    return await userWebServices.getUser(userId);
  }

  Future<NetworkHandler<User>> createNewUser(User newUser) async {
    try {
      User response = await userWebServices.createNewUser(AppStrings.token, newUser);
      return NetworkHandler.success(response);
    } catch (error) {
      return NetworkHandler.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<HttpResponse> deleteUser(int userId) async {
    return await userWebServices.deleteUser(AppStrings.token, userId);
  }
}
