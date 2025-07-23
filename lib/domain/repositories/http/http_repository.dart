import 'package:remittance/domain/dto/http/http_attrib_options.dart';

abstract class HttpRepository{
  Future<String?> send(HttpAttribOptions httpAttribOptions);
}