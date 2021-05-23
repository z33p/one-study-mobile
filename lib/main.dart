import 'package:flutter/material.dart';

import 'database/my_database.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyDatabase.init();
  runApp(MyApp());
}

