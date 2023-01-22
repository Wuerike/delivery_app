import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/horizontal_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/vertical_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/header/section_header.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        header1Text("Search"),
                        SizedBox(height: 20.h),
                        _searchInput(context),
                        SizedBox(height: 20.h),
                        _recentSearchSection(context),
                        SizedBox(height: 20.h),
                        _recommendedForYouSection(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _searchInput(BuildContext context) {
  return Container(
    height: 45.h,
    width: double.maxFinite,
    padding: EdgeInsets.only(left: 10.w, right: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45.h),
      color: AppColors.bgInputs,
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 15.sp),
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search, color: AppColors.greyColor2, size: 24.sp),
        prefixIconConstraints: BoxConstraints(
          minHeight: 40.sp,
          maxHeight: 40.sp,
          minWidth: 40.sp,
          maxWidth: 40.sp,
        ),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.zero,
      ),
    ),
  );
}

Widget _recentSearchSection(BuildContext context) {
  return Column(
    children: [
      sectionHeader(title: "Recent search", actionText: "Clear All", onActionTap: () {}),
      SizedBox(height: 10.h),
      SizedBox(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return verticalCard(
              title: "Restaurante $index",
              width: 220.w,
              textHeight: 20.h,
              imageHeight: 150.h,
              image: NetworkImage(
                "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
              ),
            );
          },
        ),
      )
    ],
  );
}

Widget _recommendedForYouSection(BuildContext context) {
  return Column(
    children: [
      sectionHeader(title: "Recommended for you"),
      SizedBox(height: 10.sp),
      horizontalCard(
        title: "Restauranteeeeeeeee numero 0",
        body: "Restaurante endereço 0",
        ratings: "0",
        stars: "0",
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
      ),
      horizontalCard(
        title: "Restaurante numero 1",
        body: "Restaurante endereço 1",
        ratings: "1",
        stars: "1",
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
      ),
      horizontalCard(
        title: "Restaurante numero 2",
        body: "Restaurante endereço 2",
        ratings: "2",
        stars: "2",
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
      ),
      horizontalCard(
        title: "Restaurante numero 2",
        body: "Restaurante endereço 2",
        ratings: "2",
        stars: "2",
        image: NetworkImage(
          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
        ),
      ),
    ],
  );
}
