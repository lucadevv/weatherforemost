import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/shared/res/app_icons.dart';
import 'package:interview_flutter/shared/res/app_size.dart';
import 'package:interview_flutter/shared/widgets/list_empty_widget.dart';
import 'package:interview_flutter/ui/providers/location_bloc/location_bloc.dart';
import 'package:interview_flutter/ui/widgets/appbar_widget.dart';
import 'package:interview_flutter/ui/widgets/bottom_navigationbar_widget.dart';
import 'package:interview_flutter/ui/widgets/floating_actionbutton_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const AppbarWidget(),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.itemList.isEmpty) {
            return ListEmptyWidget(textTheme: textTheme);
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<LocationBloc>().add(RefreshLocationsEvent());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.paddingFormVertical,
                  horizontal: AppSize.padding,
                ),
                child: ListView.builder(
                  itemCount: state.itemList.length,
                  itemBuilder: (context, index) {
                    final item = state.itemList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: AppSize.padding),
                      height: 76,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.surface,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: ListTile(
                                title: Text(
                                  item.cityName,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.background,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  item.subtitle,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.background,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            decoration: const BoxDecoration(
                              color: AppColors.itemColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                timeDay(item.localObservationDateTime),
                                Text(
                                  dateConvert(item.localObservationDateTime),
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.background,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: const FloatingActionbuttonWidget(),
      bottomNavigationBar: const BottomNavigationbarWidget(),
    );
  }

  String dateConvert(DateTime timeCity) {
    String formattedDate = DateFormat('hh:mm a').format(timeCity);
    return formattedDate;
  }

  SvgPicture timeDay(DateTime timeCity) {
    int hour = timeCity.hour;

    if (hour >= 1 && hour < 10) {
      return SvgPicture.asset(
        AppIcons.morningIcon,
        height: AppSize.weatherIconSize,
        colorFilter:
            const ColorFilter.mode(AppColors.onSecondary, BlendMode.srcIn),
      );
    } else if (hour >= 10 && hour < 17) {
      return SvgPicture.asset(
        AppIcons.sun,
        height: AppSize.weatherIconSize,
        colorFilter: const ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
      );
    } else if (hour >= 19 && hour < 24) {
      return SvgPicture.asset(
        AppIcons.night,
        height: AppSize.weatherIconSize,
        colorFilter:
            const ColorFilter.mode(AppColors.onSecondary, BlendMode.srcIn),
      );
    } else {
      return SvgPicture.asset(
        AppIcons.morningIcon,
        height: AppSize.weatherIconSize,
      );
    }
  }
}
