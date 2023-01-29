import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/horizontal_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionDetailPage extends StatefulWidget {
  const CollectionDetailPage({super.key});

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map> list = [
      {"Name": "Pizza Don Corleone 24h - Jaraguá do Sul", "quantity": 12, "isFavourite": true},
      {"Name": "BBBBBBB", "quantity": 23, "isFavourite": false},
      {"Name": "CCCCCCCCC", "quantity": 34, "isFavourite": false},
      {"Name": "DD", "quantity": 45, "isFavourite": false},
      {"Name": "EEEE EEEEE EE", "quantity": 56, "isFavourite": false},
      {"Name": "FFFFFFF", "quantity": 67, "isFavourite": false},
      {"Name": "GGGGGGGG", "quantity": 78, "isFavourite": false},
      {"Name": "HHHHHH", "quantity": 89, "isFavourite": false},
      {"Name": "IIIIII", "quantity": 90, "isFavourite": false},
      {"Name": "JJJJJ", "quantity": 90, "isFavourite": false},
      {"Name": "KKKKK", "quantity": 90, "isFavourite": false},
      {"Name": "LLLLLLLL", "quantity": 90, "isFavourite": false},
      {"Name": "MMMMMMMMM", "quantity": 90, "isFavourite": false},
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(),
          _placesNumber(120),
          _body(context, list),
        ],
      ),
    );
  }
}

Widget _appBar() {
  return SliverAppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    pinned: true,
    toolbarHeight: 56.h,
    expandedHeight: 230.h,
    backgroundColor: const Color.fromRGBO(90, 90, 90, 1),
    flexibleSpace: FlexibleSpaceBar(
      expandedTitleScale: 2,
      centerTitle: true,
      titlePadding: EdgeInsets.zero,
      title: Container(
        height: 56.h,
        alignment: Alignment.center,
        child: header1Text("Vegan", color: Colors.white),
      ),
      background: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
            image: NetworkImage(
              "https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 1.5),
            ),
          ),
        ],
      ),
    ),
    leading: Builder(
      builder: (context) => backButton(context, Colors.white),
    ),
  );
}

Widget _placesNumber(int quantity) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.only(left: 20.w, top: 20.h),
      child: bodyText("$quantity Places", color: Colors.black),
    ),
  );
}

Widget _body(BuildContext context, List<Map> list) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (context, index) {
          return horizontalCard(
            title: list[index]["Name"],
            body: "Restaurante endereço 0",
            ratings: "0",
            stars: "0",
            isFavourite: list[index]["isFavourite"],
            favouriteAction: () {
              // setState()
            },
            image: NetworkImage(
              "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
            ),
          );
        },
      ),
    ),
  );
}
