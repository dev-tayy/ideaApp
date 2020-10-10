import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../screens/createAccount/createAccount_model.dart';
import '../screens/login/login_model.dart';
import '../screens/homepage/appmodel.dart';
import '../screens/homepage/signoutmodel.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => SignUpModel()),
  ChangeNotifierProvider(create: (_) => SignOutModel()),
  ChangeNotifierProvider(create: (_) => LoginModel()),
  ChangeNotifierProvider(create: (_) => AppModel()),

];
