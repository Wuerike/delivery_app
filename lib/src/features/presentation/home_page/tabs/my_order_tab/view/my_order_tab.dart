import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/my_order_tab/view/custom_widgets/empty_order_view.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/my_order_tab/view/custom_widgets/order_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({Key? key}) : super(key: key);

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(),
          body: emptyOrderState ? const EmptyOrderView() : _ordersList(),
          bottomNavigationBar: emptyOrderState ? null : _bottomAppBar(),
        ),
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: header1Text("My Order"),
    centerTitle: true,
  );
}

Widget _ordersList() {
  return CustomScrollView(
    slivers: [
      SliverPadding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) {
              return OrderCard(index: index);
            },
          ),
        ),
      ),
    ],
  );
}

Widget _bottomAppBar() {
  return BottomAppBar(
    elevation: 0.5,
    child: Container(
      height: 175.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(210, 211, 215, 1.0),
            spreadRadius: 1.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _checkoutItem("Subtotal", 15.32),
          _checkoutItem("Cupom", -5.10),
          _checkoutItem("Delivery", null),
          SizedBox(height: 5.w),
          Container(
            height: 55.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  header3Text("Order", color: Colors.white),
                  header3Text("\$ 10.22", color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _checkoutItem(String name, double? value) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        header3Text(name, fontWeight: FontWeight.w400),
        header3Text(value == null ? "Free" : "\$ ${value.toStringAsFixed(2)}"),
      ],
    ),
  );
}
