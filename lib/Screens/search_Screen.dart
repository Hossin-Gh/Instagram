import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScr extends StatelessWidget {
  const SearchScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getShearchBar(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: _getSherarchPostList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget _getCategory() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    height: 30,
    child: ListView.builder(
      itemCount: 90,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return Row(
          children: [
            Container(
              width: 60,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: DeepBlue,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Center(
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: WhiteColor,
                      fontFamily: 'GSB',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15)
          ],
        );
      }),
    ),
  );
}

Widget _getShearchBar() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 18, top: 8, right: 18),
        height: 46,
        decoration: BoxDecoration(
          color: DeepBlue,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Image.asset('images/icon_search.png'),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search User',
                    hintStyle: TextStyle(
                      color: WhiteColor,
                      fontFamily: 'GB',
                      //fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Image.asset('images/icon_scan.png'),
            ],
          ),
        ),
      ),
      _getCategory(),
    ],
  );
}

Widget _getSherarchPostList() {
  return SliverGrid(
    gridDelegate: SliverQuiltedGridDelegate(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 10,
      repeatPattern: QuiltedGridRepeatPattern.inverted,
      pattern: [
        QuiltedGridTile(2, 2),
        QuiltedGridTile(2, 1),
        QuiltedGridTile(1, 1),
        QuiltedGridTile(1, 1),
        QuiltedGridTile(1, 1),
      ],
    ),
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: WhiteColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              child: Image.asset('images/item$index.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      childCount: 10,
    ),
  );
}
