import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/injections/dependency_injection.dart';
import 'package:remittance/data/repositories/user/user.dart';
import 'package:remittance/domain/repositories/user/user.dart';
import 'package:remittance/data/data_sources/user/user.dart';
import 'package:remittance/domain/repositories/http/http_repository.dart';
import 'package:remittance/presentation/riverpod/user/authState.dart';

// Provide the HttpRepository however you implemented it
final httpRepositoryProvider = Provider<HttpRepository>((ref) {
  return getIt<HttpRepository>(); // ✅ get from get_it
});

final userDataSourceProvider = Provider<UserDataSources>((ref) {
  return getIt<UserDataSources>();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return getIt<UserRepository>();
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(userRepositoryProvider));
});
