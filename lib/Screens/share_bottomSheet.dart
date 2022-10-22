import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({this.controler, super.key});
  final ScrollController? controler;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.3),
                  Color.fromRGBO(255, 255, 255, 0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: _getBody(controler, context)),
      ),
    );
  }
}

Widget _getBody(controler, BuildContext context) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      CustomScrollView(
        controller: controler,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 22,
                  ),
                  height: 5,
                  width: 67,
                  decoration: BoxDecoration(
                    color: WhiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: TextStyle(
                        fontFamily: 'Gb',
                        fontSize: 20,
                        color: WhiteColor,
                      ),
                    ),
                    Image.asset('images/icon_share_bottomsheet.png')
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('images/icon_search.png'),
                        SizedBox(width: 8),
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
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return _getItemGrid();
              }),
              childCount: 100,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              mainAxisExtent: 100,
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 90))
        ],
      ),
      Positioned(
        bottom: 47,
        child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 13,
            ),
            child: Text(
              'Share',
              style: TextStyle(
                color: WhiteColor,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Widget _getItemGrid() {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        child: ClipRRect(
          child: Image.asset('images/profile.png'),
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Arman Gholami',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'GB',
          fontSize: 12,
          color: WhiteColor,
        ),
      )
    ],
  );
}
