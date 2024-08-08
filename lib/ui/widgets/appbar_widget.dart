import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_flutter/shared/res/app_icons.dart';
import 'package:interview_flutter/shared/res/app_size.dart';
import 'package:interview_flutter/shared/res/app_strings.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      titleSpacing: 6,
      leading: Container(
        margin: const EdgeInsets.only(left: AppSize.padding),
        child: SvgPicture.asset(
          AppIcons.weatherIcon,
          height: AppSize.weatherIconSize,
        ),
      ),
      title: Text(
        AppStrings.appBarTitle,
        style: textTheme.bodyLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
