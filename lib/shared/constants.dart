import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:this_books/shared/onboarding_info.dart';

var decorationTextFiled = InputDecoration(
  // iconColor: Colors.grey,
  prefixIconColor: Colors.grey,
  suffixIconColor: Colors.grey,
  hintStyle: TextStyle(
    color: Colors.grey
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 0.5,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 0.5,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.blue,
      width: 0.5,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.blue,
      width: 0.5,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.green,
      width: 2,
    ),
  ),
  filled: true,
  fillColor: Colors.white,
);

//Setting
class SettingOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final Color textColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final VoidCallback onTap;

  SettingOption({
    required this.icon,
    required this.title,
    required this.trailing,
    required this.textColor,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color(0xf3f3f3)),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class OnboardingData {
  final BuildContext context;

  OnboardingData(this.context);

  List<OnboardingInfo> get items => [
        OnboardingInfo(
            title: AppLocalizations.of(context)!.onboardingTitle1,
            description: AppLocalizations.of(context)!.onboardingDes1,
            image: "images/quality.svg"),
        OnboardingInfo(
            title: AppLocalizations.of(context)!.onboardingTitle2,
            description: AppLocalizations.of(context)!.onboardingDes2,
            image: "images/delevery.svg"),
        OnboardingInfo(
            title: AppLocalizations.of(context)!.onboardingTitle3,
            description: AppLocalizations.of(context)!.onboardingDes3,
            image: "images/reward.svg"),
      ];
}


