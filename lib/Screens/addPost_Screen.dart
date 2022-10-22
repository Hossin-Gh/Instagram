import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _getSliver(),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: _getBottomBar(),
          )
        ],
      ),
    );
  }
}

Widget _getHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 60, bottom: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Post',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 24,
                color: WhiteColor,
              ),
            ),
            SizedBox(width: 15),
            Image.asset('images/icon_arrow_down.png')
          ],
        ),
        Row(
          children: [
            Text(
              'Next',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 24,
                color: WhiteColor,
              ),
            ),
            SizedBox(width: 15),
            Image.asset('images/icon_arrow_right_box.png')
          ],
        ),
      ],
    ),
  );
}

Widget _getBottomBar() {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff272B40),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        right: 17,
        left: 17,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Draft',
            style: TextStyle(
              color: PinkColor,
              fontFamily: 'GB',
              fontSize: 18,
            ),
          ),
          Text(
            'Gallery',
            style: TextStyle(
              color: WhiteColor,
              fontFamily: 'GB',
              fontSize: 18,
            ),
          ),
          Text(
            'Take',
            style: TextStyle(
              color: WhiteColor,
              fontFamily: 'GB',
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _getSliver() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeader(),
        ),
        SliverToBoxAdapter(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              child: Image.asset('images/moon.png'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            pattern: [
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
            ],
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FittedBox(
                    child: Image.asset('images/$index.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: 17,
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 84))
      ],
    ),
  );
}
