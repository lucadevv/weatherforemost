import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_flutter/domain/models/autocomplete_search/autocomplete_model.dart';
import 'package:interview_flutter/domain/models/autocomplete_search/country_model.dart';
import 'package:interview_flutter/shared/res/app_colors.dart';
import 'package:interview_flutter/shared/res/app_icons.dart';
import 'package:interview_flutter/shared/res/app_size.dart';
import 'package:interview_flutter/shared/res/app_strings.dart';
import 'package:interview_flutter/ui/providers/auto_complete_bloc/auto_complete_bloc.dart';
import 'package:interview_flutter/ui/providers/location_bloc/location_bloc.dart';

class ScrollSheetWidget extends StatefulWidget {
  const ScrollSheetWidget({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  State<ScrollSheetWidget> createState() => _ScrollSheetWidgetState();
}

class _ScrollSheetWidgetState extends State<ScrollSheetWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameCity = TextEditingController();
  final _description = TextEditingController();
  String selectedCityKey = '';
  String countryName = '';
  var key = '';
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameCity.addListener(_validateForm);
    _description.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameCity.dispose();
    _description.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled =
          _nameCity.text.isNotEmpty && _description.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
          minChildSize: 0.25,
          maxChildSize: 0.78,
          expand: false,
          builder: (
            context,
            scrollController,
          ) {
            return Container(
              height: 404,
              width: widget.size.width,
              padding: const EdgeInsets.only(
                top: 0,
                right: AppSize.padding,
                bottom: AppSize.padding,
                left: AppSize.padding,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.borderRadius),
                  topRight: Radius.circular(AppSize.borderRadius),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: SizedBox(
                  height: 404,
                  child: Column(
                    children: [
                      Container(
                        height: 4,
                        width: 32,
                        margin: const EdgeInsets.symmetric(
                            vertical: AppSize.margin),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSize.paddingFormVertical),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSize.paddingTextFromfied),
                                child: Autocomplete<String>(
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text.isEmpty) {
                                      return const Iterable<String>.empty();
                                    }
                                    return state.itemsList
                                        .where((AutoCompleteModel item) {
                                      return item.localizedName
                                          .toLowerCase()
                                          .contains(textEditingValue.text
                                              .toLowerCase());
                                    }).map((item) => item.localizedName);
                                  },
                                  onSelected: (option) {
                                    _nameCity.text = option;
                                    _validateForm();

                                    // Set the selected city key
                                    final selectedCity =
                                        state.itemsList.firstWhere(
                                      (item) => item.localizedName == option,
                                      orElse: () => AutoCompleteModel(
                                          key: "",
                                          type: '',
                                          rank: 0,
                                          localizedName: '',
                                          country: CountryModel(
                                              id: '', localizedName: '')),
                                    );
                                    selectedCityKey = selectedCity.key;
                                    final countrName =
                                        state.itemsList.firstWhere(
                                      (item) => item.localizedName == option,
                                      orElse: () => AutoCompleteModel(
                                          key: "",
                                          type: '',
                                          rank: 0,
                                          localizedName: '',
                                          country: CountryModel(
                                              id: '', localizedName: '')),
                                    );
                                    countryName =
                                        countrName.country.localizedName;
                                  },
                                  fieldViewBuilder: (
                                    BuildContext context,
                                    TextEditingController textEditingController,
                                    FocusNode focusNode,
                                    VoidCallback onFieldSubmitted,
                                  ) {
                                    return TextFormField(
                                      controller: textEditingController,
                                      onChanged: (String value) {
                                        if (value.isNotEmpty) {
                                          context.read<AutoCompleteBloc>().add(
                                              AutoCompleteSearchEvent(
                                                  searchPath: value));
                                        }
                                        _validateForm();
                                      },
                                      focusNode: focusNode,
                                      style: widget.textTheme.labelLarge,
                                      decoration: InputDecoration(
                                        label: const Text(
                                            AppStrings.tfAddCityLabel),
                                        hintText: AppStrings.tfAddCityHint,
                                        suffixIcon: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          onTap: () {
                                            textEditingController.clear();
                                            _nameCity.clear();
                                            _validateForm();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: SvgPicture.asset(
                                              AppIcons.closeIcon,
                                              height: 20,
                                              width: 20,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColors.onSuffixColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  optionsViewBuilder: (
                                    BuildContext context,
                                    AutocompleteOnSelected<String> onSelected,
                                    Iterable<String> items,
                                  ) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxHeight: 200,
                                          ),
                                          child: Container(
                                            width: widget.size.width * 0.93,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                bottomRight: Radius.circular(4),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 3,
                                                  spreadRadius: -2,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: ListView.builder(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              itemCount: items.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final String item =
                                                    items.elementAt(index);
                                                return GestureDetector(
                                                  onTap: () {
                                                    _nameCity.text = item;
                                                    onSelected(item);
                                                  },
                                                  child: ListTile(
                                                    title: Text(
                                                      item,
                                                      style: widget
                                                          .textTheme.labelLarge,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSize.paddingTextFromfied),
                                child: SizedBox(
                                  height: 118,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      _validateForm();
                                    },
                                    controller: _description,
                                    style: widget.textTheme.labelLarge,
                                    maxLines: null,
                                    expands: true,
                                    textAlignVertical: TextAlignVertical.top,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      labelText:
                                          AppStrings.tfDescriptionCityLabel,
                                      hintText:
                                          AppStrings.tfDescriptionCityHint,
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _isButtonEnabled
                              ? AppColors.onSecondary
                              : Colors
                                  .grey, // Cambia el color del botón deshabilitado
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: _isButtonEnabled
                            ? () {
                                if (_formKey.currentState!.validate() &&
                                    countryName.isNotEmpty &&
                                    selectedCityKey.isNotEmpty) {
                                  context.read<LocationBloc>().add(
                                        AddLocationEvent(
                                          key: selectedCityKey,
                                          cityName: _nameCity.text,
                                          countryName: countryName,
                                          subtitle: _description.text,
                                        ),
                                      );
                                  selectedCityKey = '';
                                  countryName = '';
                                  _nameCity.clear();
                                  _description.clear();
                                }
                              }
                            : null,
                        child: Text(
                          AppStrings.saveButton,
                          style: widget.textTheme.bodyMedium!
                              .copyWith(color: AppColors.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
