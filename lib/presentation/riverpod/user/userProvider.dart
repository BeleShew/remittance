import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/injections/dependency_injection.dart';
import 'package:remittance/domain/repositories/user/user.dart';
import 'package:remittance/presentation/riverpod/user/authState.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return getIt<UserRepository>();
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(userRepositoryProvider));
});
