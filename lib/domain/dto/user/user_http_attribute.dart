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

class GetUserListHttpAttribute extends HttpAttribOptions {
  GetUserListHttpAttribute() : super(
    baseUrl: Keys.baseURL,
    path: '/users',
    method:RequestMethods.get,
  );
}

class GetUerByIdHttpAttribute extends HttpAttribOptions {
  GetUerByIdHttpAttribute({required String userId}) : super(
    baseUrl: Keys.baseURL,
    path: '/users/$userId',
    method:RequestMethods.get,
  );
}

class UpdateHttpAttribute extends HttpAttribOptions {
  UpdateHttpAttribute({required String id,required Object body}) : super(
    baseUrl: Keys.baseURL,
    path: '/users/$id',
    body: body,
    method:RequestMethods.put,
  );
}

class TransactionHttpAttribute extends HttpAttribOptions {
  TransactionHttpAttribute({required Object body}) : super(
    baseUrl: Keys.baseURL,
    path: '/transactions',
    body: body,
    method:RequestMethods.post,
  );
}

class SendTransactionHttpAttribute extends HttpAttribOptions {
  SendTransactionHttpAttribute({required String id}) : super(
    baseUrl: Keys.baseURL,
    path: '/transactions',
    queryParameters: {"senderId":id},
    method:RequestMethods.get,
  );
}

class ReceivedTransactionHttpAttribute extends HttpAttribOptions {
  ReceivedTransactionHttpAttribute({required String id}) : super(
    baseUrl: Keys.baseURL,
    path: '/transactions',
    queryParameters: {"receiverId":id},
    method:RequestMethods.get,
  );
}