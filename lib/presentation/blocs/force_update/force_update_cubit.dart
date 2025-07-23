// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:in_app_update/in_app_update.dart';
// import 'package:injectable/injectable.dart';
// part 'force_update_state.dart';
// @lazySingleton
// class ForceUpdateCubit extends Cubit<ForceUpdateState> {
//   ForceUpdateCubit() : super(ForceUpdateInitial());
//   Future checkForUpdate()async{
//     try{
//       final updateInfo = await InAppUpdate.checkForUpdate();
//       emit(ForceUpdateSuccess(updateInfo));
//     }catch(e){
//       emit(ForcedUpdateError(e.toString()));
//     }
//   }
// }
