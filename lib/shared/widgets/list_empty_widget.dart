import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_flutter/shared/res/app_icons.dart';
import 'package:interview_flutter/shared/res/app_strings.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AppIcons.searchIcon),
        Text(
          AppStrings.titleIconSearch,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
        Text(
          AppStrings.subtitleIconSearch,
          textAlign: TextAlign.center,
          style: textTheme.labelMedium,
        )
      ],
    );
  }
}
