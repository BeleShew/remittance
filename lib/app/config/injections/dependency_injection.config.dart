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
import 'package:remittance/data/data_sources/http/local_access_token.dart'
    as _i712;
import 'package:remittance/data/data_sources/http/remote_access_token.dart'
    as _i215;
import 'package:remittance/data/repositories/http/access_token_repository.dart'
    as _i163;
import 'package:remittance/data/repositories/http/http_repositories.dart'
    as _i628;
import 'package:remittance/domain/repositories/http/access_token_repository.dart'
    as _i443;
import 'package:remittance/domain/repositories/http/http_repository.dart'
    as _i965;

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
    gh.lazySingleton<_i712.LocalAccessTokenDataSources>(
        () => _i712.LocalAccessTokenDataSources());
    gh.lazySingleton<_i215.RemoteAccessTokenDataSources>(
        () => _i215.RemoteAccessTokenDataSources());
    gh.lazySingleton<_i443.AccessTokenRepository>(
        () => _i163.AccessTokenRepositoryImpl(
              gh<_i215.RemoteAccessTokenDataSources>(),
              gh<_i712.LocalAccessTokenDataSources>(),
            ));
    gh.lazySingleton<_i876.HttpDataSources>(
        () => _i876.HttpDataSources(gh<_i443.AccessTokenRepository>()));
    gh.lazySingleton<_i965.HttpRepository>(
        () => _i628.HttpRepositoryImpl(gh<_i876.HttpDataSources>()));
    return this;
  }
}
