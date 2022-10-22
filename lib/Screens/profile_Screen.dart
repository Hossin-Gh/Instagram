import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScr extends StatelessWidget {
  const UserProfileScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 40,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, right: 18),
                    child: Icon(Icons.menu),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: BlackColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                backgroundColor: BlackColor,
                expandedHeight: 170,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item8.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeader(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViweDelegate(
                  TabBar(
                    labelStyle: TextStyle(fontFamily: 'GB', fontSize: 20),
                    indicatorPadding:
                        EdgeInsets.only(left: 18, right: 18, bottom: 4),
                    indicatorColor: PinkColor,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  _getPostList('item'),
                ],
              ),
              // CustomScrollView(
              //   slivers: [
              //     _getPostList(''),
              //   ],
              // ),
              Container(
                //color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 17),
    child: Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: PinkColor,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset('images/1.png'),
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          height: 70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ارمان برنامه نویس فلاتر',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'arman gholami',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 12,
                    color: WhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Image.asset('images/icon_profile_edit.png')
      ],
    ),
  );
}

class TabBarViweDelegate extends SliverPersistentHeaderDelegate {
  TabBarViweDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: BlackColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

Widget _getPostList(String nameForImages) {
  return SliverPadding(
    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
    sliver: SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 2),
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
                child: Image.asset('images/$nameForImages$index.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: 10,
      ),
    ),
  );
}
