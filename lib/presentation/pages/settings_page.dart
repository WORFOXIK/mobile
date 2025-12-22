import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aichatbot/core/theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) =>
                  RotationTransition(turns: animation, child: child),
              child: IconButton(
                key: ValueKey<bool>(themeProvider.isDarkMode),
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
