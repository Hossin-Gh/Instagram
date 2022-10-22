import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:flutter_application_1/model/enums/activity_type_enum.dart';

class ActivityScr extends StatefulWidget {
  const ActivityScr({super.key});

  @override
  State<ActivityScr> createState() => _ActivityScrState();
}

class _ActivityScrState extends State<ActivityScr>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: BlackColor,
              child: TabBar(
                labelStyle: TextStyle(fontFamily: 'GB', fontSize: 20),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: PinkColor,
                indicatorWeight: 3,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text('Following'),
                  ),
                  Tab(
                    child: Text('You'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampelList(),
                  _getSampelList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getSampelList() {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            top: 20,
          ),
          child: Text(
            'New',
            style: TextStyle(
              color: WhiteColor,
              fontSize: 24,
              fontFamily: 'GB',
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.messge);
          },
          childCount: 2,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            top: 20,
          ),
          child: Text(
            'Today',
            style: TextStyle(
              color: WhiteColor,
              fontSize: 24,
              fontFamily: 'GB',
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.followBack);
          },
          childCount: 3,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.like);
          },
          childCount: 2,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            top: 20,
          ),
          child: Text(
            'This Week',
            style: TextStyle(
              color: WhiteColor,
              fontSize: 24,
              fontFamily: 'GB',
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.messge);
          },
          childCount: 1,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.like);
          },
          childCount: 2,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.followBack);
          },
          childCount: 1,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.messge);
          },
          childCount: 1,
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _getRow(ActivityStatus.followBack);
          },
          childCount: 1,
        ),
      ),
    ],
  );
}

Widget _getRow(ActivityStatus status) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, right: 18, left: 18),
    child: Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: PinkColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/2.png'),
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Arman Gholami',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 12,
                    color: WhiteColor,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Started Following',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 12,
                    color: WhiteColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'You',
                  style: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '3min',
                  style: TextStyle(
                    fontFamily: 'GB',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        _getAction(status)
      ],
    ),
  );
}

Widget _getAction(ActivityStatus status) {
  switch (status) {
    case ActivityStatus.followBack:
      return ElevatedButton(
        onPressed: () {},
        child: Text('Follow'),
        style: ElevatedButton.styleFrom(
          primary: PinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      );

    case ActivityStatus.like:
      return SizedBox(
        height: 40,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset('images/8.png'),
          ),
        ),
      );

    case ActivityStatus.messge:
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: GreyColor,
          ),
        ),
        child: Text(
          'Message',
          style: TextStyle(
            color: GreyColor,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        ),
      );
    default:
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: GreyColor,
          ),
        ),
        child: Text(
          'Message',
          style: TextStyle(
            color: GreyColor,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        ),
      );
  }
}
