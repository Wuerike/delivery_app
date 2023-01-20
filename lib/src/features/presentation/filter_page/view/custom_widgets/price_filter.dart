import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  var _values = const RangeValues(0, 50);
  int _minPrice = 0;
  int _maxPrice = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bodyText("R\$: $_minPrice"),
            bodyText("R\$: $_maxPrice"),
          ],
        ),
        SizedBox(
          width: 300.w,
          child: RangeSlider(
            values: _values,
            min: 0,
            max: 100,
            divisions: 10,
            activeColor: AppColors.orange,
            inactiveColor: AppColors.greyColor,
            onChanged: (RangeValues newValues) {
              setState(() {
                _values = newValues;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
      ],
    );
  }
}
