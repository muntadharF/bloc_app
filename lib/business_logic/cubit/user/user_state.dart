import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/network_exceptions.dart';
part 'user_state.freezed.dart';

@freezed
class UserState<T> with _$UserState<T> {
  const factory UserState.idle() = Idle<T>;

  const factory UserState.loading() = Loading<T>;

  const factory UserState.success(T data) = Success<T>;

  const factory UserState.failure(NetworkExceptions networkExceptions) =
      Failure<T>;
}
