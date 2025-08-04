import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSwitcherWidget extends StatefulWidget {
  final double widthFactor;
  final double heightFactor;

  const ThemeSwitcherWidget({
    Key? key,
    this.widthFactor = 0.4,
    this.heightFactor = 0.4,
  }) : super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  Future<void> _saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width * widget.widthFactor,
          height: MediaQuery.of(context).size.width * widget.heightFactor,
          decoration: BoxDecoration(
            color: _isDarkTheme ? Colors.grey[800] : Colors.blue[200],
            borderRadius: BorderRadius.circular(_isDarkTheme ? 30.0 : 10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Theme Switch',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isDarkTheme = !_isDarkTheme;
              _saveTheme(_isDarkTheme);
            });
          },
          child: Text(
              _isDarkTheme ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
        ),
      ],
    );
  }
}
