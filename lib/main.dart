import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_switcher/widgets/image_picker_widget.dart';
import 'package:theme_switcher/widgets/theme_switcher_widget.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure initialization for shared_preferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme & Image Picker Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme & Image Picker Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.all(16.0), // Added padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThemeSwitcherWidget(
                widthFactor: 0.5,
                heightFactor: 0.5,
              ),
              const SizedBox(height: 20),
              ImagePickerWidget(
                imageSize: 250.0,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
