import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/slidable_container.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '@username',
                style: kScreenTitleStyle,
              ),
              Icon(Icons.more_vert)
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Shared ideas')),
              Tab(child: Text('Saved ideas'))
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(child: Text('I LOVE CODING', style: kScreenTitleStyle)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(children: [
              SlidableContainer(),
              SizedBox(height: 10.0),
              SlidableContainer(),
              SizedBox(height: 10.0),
              SlidableContainer(),
               SizedBox(height: 10.0),
            ]),
          )
        ]),
      ),
    );
  }
}

class SharedIdeas extends StatelessWidget {
  const SharedIdeas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
