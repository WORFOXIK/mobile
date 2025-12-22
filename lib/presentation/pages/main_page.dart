import 'package:aichatbot/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:aichatbot/presentation/pages/home_page.dart';
import 'package:aichatbot/presentation/pages/discover_page.dart';
import 'package:aichatbot/presentation/pages/tasks_page.dart';
import 'package:aichatbot/presentation/pages/chats_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChatsPage(),
    TasksPage(),
    DiscoverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,

          selectedIconTheme: IconThemeData(
            size: 28,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          unselectedIconTheme: IconThemeData(
            size: 24,
            color: themeProvider.isDarkMode
                ? Colors.grey[400]!
                : Colors.grey[600]!,
          ),

          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),

            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''),

            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_sharp),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          ],
        ),
      ),
    );
  }
}
