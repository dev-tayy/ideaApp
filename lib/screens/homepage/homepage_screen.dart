import 'package:flutter/material.dart';
import 'package:ideaApp/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appmodel.dart';
import '../homepage/idea_posts.dart';
import '../homepage/create.dart';
import '../homepage/profile.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  static String id = 'home_page';
  final String username;

  const HomePage({Key key, this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> getUsername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString(SharedPref.usernameKey);
    //print(username);
    return username;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppModel>(context);
    return FutureBuilder(
      future: getUsername(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
            body: IndexedStack(
              children: [
                IdeaPosts(
                  username: snapshot.data,
                ),
                CreateScreen(),
                ProfileScreen(
                  username: snapshot.data,
                )
              ],
              index: model.currentIndex,
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Container(height: 0.0, width: 0.0);
      },
    );
  }
}

//TODO: TRY TO USE INDEXEDSTACK WITH FUTUREBUILDER TO RENDER THE TEXT IN THE CONTAINER // PAGE CONTROLLER WITH AUTOMATICMIXIN'
