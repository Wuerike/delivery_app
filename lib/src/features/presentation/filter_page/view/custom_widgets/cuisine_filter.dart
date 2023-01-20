import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CuisineFilter extends StatefulWidget {
  const CuisineFilter({super.key});

  @override
  State<CuisineFilter> createState() => _CuisineFilterState();
}

class _CuisineFilterState extends State<CuisineFilter> {
  List<bool> states = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> cuisinesNames = [
    "American",
    "Asia",
    "Sushi",
    "Pizza",
    "Desserts",
    "Fast Food",
    "Vietnamese",
  ];

  final List<String> _selections = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.w,
        children: List.generate(
          cuisinesNames.length,
          (index) {
            return _filterChip(
              label: cuisinesNames[index],
              isSelected: _selections.contains(cuisinesNames[index]),
              onSelected: (bool isSelected) {
                setState(
                  () {
                    if (isSelected) {
                      _selections.add(cuisinesNames[index]);
                    } else {
                      _selections.removeWhere((String name) {
                        return name == cuisinesNames[index];
                      });
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _filterChip({String label = "", Function(bool)? onSelected, bool isSelected = false}) {
  var color = isSelected ? AppColors.orange : AppColors.greyColor;

  return FilterChip(
    elevation: 2,
    label: bodyText(label, color: color),
    selectedColor: Colors.white,
    backgroundColor: Colors.white,
    side: BorderSide(
      color: color,
    ),
    showCheckmark: false,
    selected: isSelected,
    onSelected: onSelected,
  );
}
