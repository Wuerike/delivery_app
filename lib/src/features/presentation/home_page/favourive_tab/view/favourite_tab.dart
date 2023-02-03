import 'package:delivery_app/src/features/presentation/shared/components/cards/place_horizontal_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteTab extends StatefulWidget {
  FavouriteTab({Key? key}) : super(key: key);

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(),
          body: _favouritesList(),
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
    title: header1Text("My Favourites"),
    centerTitle: true,
  );
}

Widget _favouritesList() {
  return CustomScrollView(
    slivers: [
      SliverPadding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 9,
            (context, index) {
              return Container(
                padding: EdgeInsets.all(10.h),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(210, 211, 215, 1.0),
                      spreadRadius: 1.0,
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: placeHorizontalCard(
                  title: "Restaurante numero $index",
                  body: "Restaurante endereço $index",
                  ratings: "0",
                  stars: "0",
                  isFavourite: true,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
