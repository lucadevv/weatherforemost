import 'package:flutter/material.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/shared/res/navigationbar_items.dart';

class BottomNavigationbarWidget extends StatelessWidget {
  const BottomNavigationbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.onPrimary,
      elevation: 20,
      currentIndex: 1,
      onTap: (value) {},
      items: listNavigationItems,
    );
  }
}
