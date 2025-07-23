import 'package:injectable/injectable.dart';
import 'package:remittance/domain/dto/http/http_attrib_options.dart';
import 'package:remittance/domain/repositories/http/http_repository.dart';
import '../../data_sources/http/http_data_sources.dart';

@LazySingleton(as: HttpRepository)
class HttpRepositoryImpl extends HttpRepository{
  final HttpDataSources _httpDataSources;
  HttpRepositoryImpl(this._httpDataSources);

  @override
  Future<String?> send(HttpAttribOptions httpAttribOptions) {
    return _httpDataSources.send(httpAttribOptions);
  }
}