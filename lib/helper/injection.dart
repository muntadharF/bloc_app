import 'package:get_it/get_it.dart';

import '../business_logic/cubit/user/user_cubit.dart';
import '../data/repository/user_repository.dart';
import '../data/web_services/user_web_services.dart';

final GetIt getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<UserCubit>(
    () => UserCubit(userRepository: getIt()),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(userWebServices: getIt()),
  );
  
  getIt.registerLazySingleton<UserWebServices>(
    () => UserWebServices(UserWebServices.createAndSetupDio()),
  );
}
