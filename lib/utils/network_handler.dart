import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exceptions.dart';

part 'network_handler.freezed.dart';

@freezed
abstract class NetworkHandler<T> with _$NetworkHandler<T> {
  const factory NetworkHandler.success(T data) = Success<T>;
  const factory NetworkHandler.failure(NetworkExceptions exceptions) =
      Failure<T>;
}
