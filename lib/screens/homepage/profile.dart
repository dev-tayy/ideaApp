import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/slidable_container.dart';
import '../homepage/signoutmodel.dart';
import 'package:provider/provider.dart';

enum PopUpValue { darkMode, signOut }

class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<SignOutModel>(context);

    _onSelect(PopUpValue value) async {
      switch (value) {
        case PopUpValue.darkMode:
          // ignore: unnecessary_statements
          null;
          break;
        case PopUpValue.signOut:
          await model.signout(context);
      }
    }

    PopupMenuButton buildPopupMenuButton() {
      return PopupMenuButton<PopUpValue>(
        itemBuilder: (BuildContext context) {
          var popUpList = List<PopupMenuEntry<PopUpValue>>();
          popUpList.add(
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  Switch(
                      activeColor: Colors.deepOrange,
                      value: false,
                      onChanged: (boolVal) {}),
                ],
              ),
              value: PopUpValue.darkMode,
            ),
          );
          popUpList.add(
            PopupMenuItem(
              child: Text("Logout"),
              value: PopUpValue.signOut,
            ),
          );
          return popUpList;
        },
        onSelected: _onSelect,
      );
    }

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
              buildPopupMenuButton()
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
