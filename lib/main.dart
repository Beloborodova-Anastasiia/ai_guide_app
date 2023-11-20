import 'package:flutter/material.dart';

import 'package:ai_guide/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(AiGuideApp());
}
