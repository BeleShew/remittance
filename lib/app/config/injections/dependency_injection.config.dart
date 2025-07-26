// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remittance/data/data_sources/http/http_data_sources.dart'
    as _i876;
import 'package:remittance/data/data_sources/user/user.dart' as _i542;
import 'package:remittance/data/repositories/http/http_repositories.dart'
    as _i628;
import 'package:remittance/data/repositories/user/user.dart' as _i912;
import 'package:remittance/domain/repositories/http/http_repository.dart'
    as _i965;
import 'package:remittance/domain/repositories/user/user.dart' as _i419;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i876.HttpDataSources>(() => _i876.HttpDataSources());
    gh.lazySingleton<_i965.HttpRepository>(
        () => _i628.HttpRepositoryImpl(gh<_i876.HttpDataSources>()));
    gh.lazySingleton<_i542.UserDataSources>(
        () => _i542.UserDataSources(gh<_i965.HttpRepository>()));
    gh.lazySingleton<_i419.UserRepository>(
        () => _i912.UserRepositoryImpl(gh<_i542.UserDataSources>()));
    return this;
  }
}
