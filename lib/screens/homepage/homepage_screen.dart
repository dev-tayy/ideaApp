import 'package:flutter/material.dart';
import 'appmodel.dart';
import '../homepage/idea_posts.dart';
import '../homepage/create.dart';
import '../homepage/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _children = [IdeaPosts(), CreateScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppModel>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text(''),
          ),
        ],
        onTap: model.toggle,
        currentIndex: model.currentIndex,
      ),
      body: _children[model.currentIndex],
    );
  }
}
