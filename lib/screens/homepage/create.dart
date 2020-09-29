import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/textfield_widget.dart';
import '../../widgets/raised_button.dart';
import '../homepage/homepage_screen.dart';

class CreateScreen extends StatefulWidget {
  static String id = 'create_screen';
  const CreateScreen({Key key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController ideaNameController = TextEditingController();
  TextEditingController ideaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New idea',
                  style: kScreenTitleStyle,
                ),
                SizedBox(height: 30),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF303030),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.border_color),
                          SizedBox(width: 10),
                          Text(
                            'Draft',
                            style: kButtonTextStyle,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(child: Text('1')),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Text('OR CREATE NEW'),
                ),
                SizedBox(height: 30),
                FormTextField(
                  hintText: 'Name your idea',
                  controller: ideaNameController,
                  obscureText: false,
                ),
                SizedBox(height: 10.0),
                FormTextField(
                  hintText: 'Write a short description',
                  controller: ideaController,
                  obscureText: false,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(height: 30),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF303030),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.attach_file),
                      SizedBox(width: 10),
                      Text(
                        'Add files',
                        style: kButtonTextStyle,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: ButtonWidget(onPressed: null, label: 'Create'),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, HomePage.id),
                    child: Text(
                      'Do it later',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
