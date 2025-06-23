import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/auth_model.dart';
import '../repo/auth_repo.dart';

part 'auth_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<AuthModel?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.login(email: email, password: password);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (loginResponse) {
        state = AsyncValue.data(loginResponse);
        ref.read(authStateProvider.notifier).login();
      },
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.logout();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (message) {
        state = const AsyncValue.data(null);
        ref.read(authStateProvider.notifier).logout();
      },
    );
  }
}

@riverpod
UserData? currentUser(Ref ref) {
  final repository = ref.read(authRepositoryProvider);
  return repository.getCurrentUser();
}
