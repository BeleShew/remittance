// import 'package:bloc/bloc.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:yefl_pay/app/utils/helper_methods.dart';
// import 'package:yefl_pay/domain/dto/language/language_model.dart';
// part 'language_state.dart';
//
// @lazySingleton
// class LanguageCubit extends Cubit<LanguageState> {
//   LanguageCubit() : super(LanguageInitial());
//   changeLanguage(BuildContext context, Language language) {
//     context.setLocale(Locale(language.languageCode));
//     state.language = language;
//   }
//
//   Language getCurrentLanguage(BuildContext context) {
//     try {
//       var currentLanguage = context.locale.toString();
//       if (currentLanguage.isNotEmpty) {
//         return languageMap.firstWhere((lang) => lang.languageCode.toUpperCase() == currentLanguage.toUpperCase());
//       }
//       return languageMap.first;
//     } catch (e) {
//       debugPrint(e.toString());
//       return languageMap.first;
//     }
//   }
// }
