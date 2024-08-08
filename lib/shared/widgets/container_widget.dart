import 'package:flutter/material.dart';

import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/shared/res/app_size.dart';

class ContainerLoading extends StatelessWidget {
  const ContainerLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: size.width,
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        top: 0,
        right: AppSize.padding,
        bottom: AppSize.padding,
        left: AppSize.padding,
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.onSecondary,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
