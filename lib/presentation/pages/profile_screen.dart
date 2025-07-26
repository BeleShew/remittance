import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/config/route/routes.gr.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/riverpod/theme/theme_mode_provider.dart';
import 'package:remittance/presentation/riverpod/transaction/transaction_provider.dart';
import 'package:remittance/presentation/riverpod/user/user_provider.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/theme_selector.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends ConsumerState<ProfileScreen>{
@override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    return Scaffold(
      appBar: AppBarWidget(elevation: 0,title: const Text("Profile"),centerTitle: true,),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MySize.size30,),
                  _profileImage(),
                  SizedBox(height: MySize.size20,),
                  _userName(user?.name??"Belesh"),
                  _userPhoneNumber(user?.phoneNumber??098327),
                  SizedBox(height: MySize.size20,),
                  _editProfiles(),
                  SizedBox(height: MySize.size20,),
                  _preferences(),
                ],
              ),
            ),
          ),
          _socialMediaWidget(context),
          SizedBox(height: MySize.size10,),
        ],
      ),
    );
  }

  Widget _socialMediaWidget(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
             Icon(Icons.facebook,color: Theme.of(context).brightness == Brightness.dark? AppColors.lightGrey: AppColors.darkGrey,),
            SizedBox(width: MySize.size14,),
             Icon(Icons.telegram,color: Theme.of(context).brightness == Brightness.dark? AppColors.lightGrey: AppColors.darkGrey,),
            SizedBox(width: MySize.size14,),
            Icon(Icons.email,color: Theme.of(context).brightness == Brightness.dark? AppColors.lightGrey: AppColors.darkGrey,),
            SizedBox(width: MySize.size14,),
          ],
        );
  }

  Widget _preferences() {
    return Padding(
        padding: EdgeInsets.all(MySize.size16 ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _preferencesText(),
            SizedBox(height: MySize.size10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.25),
                // color: Theme.of(context).brightness == Brightness.dark? AppColors.lightGrey: AppColors.lightestGrey,
                borderRadius: BorderRadius.circular(MySize.size20 ?? 0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildListTile(
                    title: "Push Notification",
                    icon: Icons.notifications,
                    subtitle: "Received consents and updates",
                    context: context,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  _buildListTile(
                    title: "Finger Print",
                    context: context,
                    subtitle: "Enable finger print",
                    icon: Icons.fingerprint_rounded,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  _buildListTile(
                    title: "Pin Code",
                    context: context,
                    subtitle: "Update your pin code",
                    icon: Icons.password_rounded,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),

                  _buildListTile(
                    title: "Language",
                    subtitle: "Select your preferred language",
                    context: context,
                    icon: Icons.language_rounded,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),

                  _buildListTile(
                    title: "Theme",
                    subtitle: "Change the app theme",
                    context: context,
                    icon: Icons.dark_mode_rounded,
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => ThemeSelectorSheet(ref),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),

                  _buildListTile(
                    title: "About",
                    subtitle: "About this app",
                    context: context,
                    icon: Icons.info,
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),

                  _buildListTile(
                    title: "Logout",
                    icon: Icons.logout_outlined,
                    context: context,
                    leadingColor: AppColors.blue,
                    titleColor: AppColors.blue,
                    onTap: (){
                      ref.invalidate(transactionDataProvider);
                      context.router.replace(const LoginRoute());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios_outlined,),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget _preferencesText() {
    return TextWidgetText.textWidget(
            text: "Preferences",
            themeData: context.themeData.textTheme.displaySmall!,
            fontSize: MySize.size16,
            fontWeight: 400,
            textAlign: TextAlign.start,
            color: AppColors.darkGrey,
          );
  }

  Widget _buildListTile({required String title,String? subtitle,  required IconData icon, required Widget trailing,Color? titleColor,required BuildContext context, VoidCallback? onTap, Color? leadingColor}) {
    return ListTile(
      title: TextWidgetText.textWidget(
        text: title,
        themeData: context.themeData.textTheme.displaySmall!,
        fontSize: MySize.size16,
        fontWeight: 400,
        textAlign: TextAlign.start,
        color: titleColor,
      ),
      subtitle:subtitle!=null? TextWidgetText.textWidget(
        text: subtitle,
        themeData: context.themeData.textTheme.displaySmall!,
        fontSize: MySize.size12,
        fontWeight: 400,
        textAlign: TextAlign.start,
        color: titleColor,
      ):Container(),
      leading: Icon(icon,color: leadingColor,),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _editProfiles() {
    return Center(
          child: Container(
            decoration: BoxDecoration(
            // color: AppColors.black,
            color: Theme.of(context).brightness == Brightness.dark? AppColors.black: AppColors.lightestGrey,
            shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size16??0))
          ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:MySize.size16??0,vertical: MySize.size5??0),
              child: TextWidgetText.textWidget(
                text:"Edit Profile",
                themeData: context.themeData.textTheme.displaySmall!,
                fontSize: MySize.size16,
                fontWeight: 500,
                textAlign: TextAlign.start,
                color:Theme.of(context).brightness == Brightness.dark? AppColors.white: AppColors.black,
              ),
            ),
          ),
        );
  }

  Widget _userPhoneNumber(int phone) {
    return Center(
          child: TextWidgetText.textWidget(
            text:"$phone",
            themeData: context.themeData.textTheme.displaySmall!,
            fontSize: MySize.size16,
            fontWeight: 500,
            textAlign: TextAlign.start,
            color:AppColors.darkGrey,
          ),
        );
  }

  Widget _userName(String name) {
    return Center(
          child: TextWidgetText.textWidget(
            text:name.toUpperCase(),
            themeData: context.themeData.textTheme.displaySmall!,
            fontSize: MySize.size16,
            fontWeight: 700,
            textAlign: TextAlign.start,
            // color:AppColors.lightPrime,
            color:Theme.of(context).brightness == Brightness.dark? AppColors.lightPrime: AppColors.darkGrey,
          ),
        );
  }

  Widget _profileImage() {
    return CircleAvatar(
      radius: MySize.size28,
          // backgroundColor: AppColors.white,
          backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.white: AppColors.lightestGrey,
          child: Icon(Icons.account_circle_outlined,
            size: MySize.size28,
            color: AppColors.primary,),
        );
  }
}
