import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/utils/helper_methods.dart';

class LocalAuth {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> _initAuth() async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  Future<bool> _checkBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  Future<List<BiometricType>?> _getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return <BiometricType>[];
    }
  }

  Future<bool> authenticate(context) async {
    try {
      if(await _initAuth() && await _checkBiometrics()){
        var result =await _getAvailableBiometrics();
        if(result!=null && result.isNotEmpty){
          return await _auth.authenticate(
              localizedReason: 'PleaseScanYourFingerprintFace',
              options: const AuthenticationOptions(
                stickyAuth: true,
                biometricOnly: true,
              ),
          );
        }
        else{
          showAnimatedSnackBar(
            message: 'thereIsNoAvailableBiometricData',
            context: context,
            textColor: AppColors.primary,
            backgroundColor:AppColors.lightGrey,
            showCloseIcon: true,
          );
          return false;
        }
      }
      else{
        showAnimatedSnackBar(
          message: 'yourDevicesIsNotSupportFaceIDOrFingerPrintPleaseLoginWithPasswordAndUserName',
          context: context,
          textColor: AppColors.primary,
          backgroundColor:AppColors.lightGrey,
          showCloseIcon: true,
        );
        return false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'PleaseScanYourFingerprintFace',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  Future<void> cancelAuthentication() async {
    await _auth.stopAuthentication();
  }
}
