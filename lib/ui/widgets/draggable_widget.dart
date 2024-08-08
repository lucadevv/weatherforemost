import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/ui/providers/auto_complete_bloc/auto_complete_bloc.dart';
import 'package:interview_flutter/ui/widgets/scroll_sheet_widget.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<AutoCompleteBloc, AutoCompleteState>(
      listener: (context, state) {
        if (state.autoCompleteStatus == AutoCompleteStatus.error) {
          final snackBar = SnackBar(
            content: Text(state.errorMessage),
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
            margin: EdgeInsets.only(
              bottom: size.height - size.height * 0.3,
              left: 10,
              right: 10,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: ScrollSheetWidget(size: size, textTheme: textTheme),
    );
  }
}
