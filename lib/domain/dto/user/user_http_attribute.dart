import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/keys.dart';
import 'package:remittance/domain/dto/http/http_attrib_options.dart';

class LoginHttpAttribute extends HttpAttribOptions {
  LoginHttpAttribute({required String email}) : super(
    baseUrl: Keys.baseURL,
    path: '/users',
    method:RequestMethods.get,
    queryParameters: {"email":email}
  );
}

class RegisterHttpAttribute extends HttpAttribOptions {
  RegisterHttpAttribute({required Object request}) : super(
    baseUrl: Keys.baseURL,
    path: '/users',
    body:request,
    method:RequestMethods.post,
  );
}