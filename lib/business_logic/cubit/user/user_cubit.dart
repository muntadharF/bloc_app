import 'package:bloc_app/utils/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user.dart';
import '../../../data/repository/user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState<User>> {
  final UserRepository userRepository;

  UserCubit({required this.userRepository}) : super(const Idle());

  // void getAllUsers() async {
  //   var data = await userRepository.getAllUsers();

  //   data.when(
  //     success: (List<User> users) {
  //       emit(UserState.success(users));
  //     },
  //     failure: (NetworkExceptions exceptions) {
  //       emit(UserState.failure(exceptions));
  //     },
  //   );
  // }

  void getUser(int userId) {
    userRepository.getUser(userId).then((userDetails) {
      // emit(UserDetailsLoaded(userDetails: userDetails));
    });
  }

  void createNewUser(User newUser) async {
    var data = await userRepository.createNewUser(newUser);

    data.when(
      success: (User user) {
        emit(UserState.success(user));
      },
      failure: (NetworkExceptions exceptions) {
        emit(UserState.failure(exceptions));
      },
    );
  }

  void deleteUser(int userId) {
    userRepository.deleteUser(userId).then((data) {
      // emit(DeleteUser(data: data));
    });
  }
}
