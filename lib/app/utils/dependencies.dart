import 'package:remittance/app/utils/easy_loading.dart';
import '../config/injections/dependency_injection.dart';

class Dependencies{
  static init()async{
     configureDependencies();
     await EasyLoadingWidget.init();
  }
}