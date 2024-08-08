import 'package:flutter/material.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/ui/widgets/draggable_widget.dart';

class FloatingActionbuttonWidget extends StatelessWidget {
  const FloatingActionbuttonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const DraggableWidget(),
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: AppColors.onPrimary,
      ),
    );
  }
}
