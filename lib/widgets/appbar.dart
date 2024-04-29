import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/utils/constants/colors.dart';
import 'package:weather_app/utils/helpers/helper_functions.dart';

class MainAppBar extends StatelessWidget implements PreferredSize {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = myHelperFunctions.isDarkMode(context);

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(Iconsax.message_question)
        ),
      ],
      leading: Icon(Iconsax.cloud, color: dark ? myColors.white : myColors.dark ,),
    );
  }
  
  @override
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}