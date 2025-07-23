import 'dart:developer' as developer;
class ErrorLog{

  log(String message,{String name="Error",Object? error,StackTrace? stackTrace,int level = 0}){
    developer.log(message,name: name,error: error,stackTrace: stackTrace,level: level);
  }
}