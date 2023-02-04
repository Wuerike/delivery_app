import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/place_detail_page/view/custom_widgets/drop_menu_list_item.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/item_vertical_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/header/section_header.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> reviewList = [
      {
        "Name": "João da Silva",
        "Quantity": 45,
        "Stars": 3,
        "Text":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
      {
        "Name": "Pedro Henrique",
        "Quantity": 7,
        "Stars": 4,
        "Text": null,
      },
      {
        "Name": "Amanda Silveira",
        "Quantity": 13,
        "Stars": 1,
        "Text":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(context),
          _featuredItemsSection(),
          _menuSection(),
          _reviewSection(reviewList),
        ],
      ),
      bottomNavigationBar: _addToOrderButton(),
    );
  }
}

Widget _appBar(BuildContext context) {
  return SliverAppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    expandedHeight: 350.h,
    backgroundColor: const Color.fromRGBO(90, 90, 90, 1),
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
            image: NetworkImage(
              "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80",
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 1.5),
            ),
            child: header1Text(
              "Hamburgueria Vegana Sangue de Boi - Jaraguá do sul - 24h por diaaaaaaaaa",
              color: Colors.white,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70.h,
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white60))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _appBarPlaceStats(
                    icon: Icons.star,
                    iconText: "4.5",
                    subText: "351 Ratings",
                    width: (MediaQuery.of(context).size.width - 2) / 3,
                  ),
                  Container(decoration: const BoxDecoration(border: Border(left: BorderSide(color: Colors.white60)))),
                  _appBarPlaceStats(
                    icon: Icons.bookmark,
                    iconText: "137k",
                    subText: "Favourites",
                    width: (MediaQuery.of(context).size.width - 2) / 3,
                  ),
                  Container(decoration: const BoxDecoration(border: Border(left: BorderSide(color: Colors.white60)))),
                  _appBarPlaceStats(
                    icon: Icons.photo_library_outlined,
                    iconText: "346",
                    subText: "Photos",
                    width: (MediaQuery.of(context).size.width - 2) / 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    leading: backButton(context, Colors.white),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.share,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.bookmark_border,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
    ],
  );
}

Widget _appBarPlaceStats({
  IconData? icon,
  String iconText = "",
  String subText = "",
  Color color = Colors.white,
  double? width,
}) {
  return Container(
    width: width,
    alignment: Alignment.center,
    child: Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 15.sp, color: color),
              bodyText(" "),
              bodyText(iconText, fontWeight: FontWeight.bold, color: color),
            ],
          ),
          bodyText(subText, color: color),
        ],
      ),
    ),
  );
}

Widget _featuredItemsSection() {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    sliver: SliverList(
      delegate: SliverChildListDelegate(
        [
          sectionHeader(title: "Featured Items"),
          SizedBox(height: 10.h),
          SizedBox(
            height: 190.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return itemVerticalCard(
                  title: "Product $index",
                  price: 12.50,
                  buttonLabel: "Select",
                  width: 220.w,
                  imageHeight: 120.h,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                  ),
                  buttonIcon: AssetImage("assets/plus_order.png"),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget _menuSection() {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    sliver: SliverList(
      delegate: SliverChildListDelegate(
        [
          sectionHeader(title: "Menu"),
          SizedBox(height: 10.h),
          DropMenuListItem(label: "Salads", quantity: 5),
          DropMenuListItem(label: "Chicken", quantity: 12),
          DropMenuListItem(label: "Soups", quantity: 3),
          DropMenuListItem(label: "Vegetables", quantity: 777),
        ],
      ),
    ),
  );
}

Widget _reviewSection(List<Map> reviewList) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    sliver: SliverList(
      delegate: SliverChildListDelegate(
        [
          sectionHeader(title: "Reviews", actionText: "Show All", icon: Icons.play_arrow, onActionTap: () {}),
          SizedBox(height: 10.h),
          Column(
            children: List.generate(3, (int index) {
              return _reviewCard(reviewList[index]);
            }),
          )
        ],
      ),
    ),
  );
}

Widget _reviewCard(Map<dynamic, dynamic> review) {
  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: 10.h),
    child: Container(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyColor),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
              child: Row(
                children: [
                  Container(
                    width: 40.h,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bodyText("${review["Stars"]}", color: Colors.white),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header3Text(review["Name"]),
                      bodyText("${review["Quantity"]} Reviews"),
                    ],
                  ),
                ],
              ),
            ),
            review["Text"] == null
                ? Container()
                : Column(
                    children: [
                      SizedBox(height: 10.h),
                      bodyText(
                        review["Text"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );
}

Widget _addToOrderButton() {
  return Container(
    height: 55.h,
    width: 300.w,
    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
    decoration: BoxDecoration(
      color: AppColors.orange,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          header3Text("Add to Order", color: Colors.white),
          header3Text("\$ 53.13", color: Colors.white),
        ],
      ),
    ),
  );
}
