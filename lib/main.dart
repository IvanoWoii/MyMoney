import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme/app_colors.dart';
import 'screens/dashboard_screen.dart';
import 'screens/history_screen.dart';
import 'screens/bounty_screen.dart';
import 'screens/add_screen.dart';

void main() {
  runApp(const QuestAndCoinApp());
}

class QuestAndCoinApp extends StatelessWidget {
  const QuestAndCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest & Coin',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.surface,
        textTheme: GoogleFonts.spaceMonoTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: AppColors.onSurface,
          displayColor: AppColors.onSurface,
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    HistoryScreen(),
    BountyScreen(),
    AddScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          border: Border(
            top: BorderSide(color: AppColors.outlineVariant, width: 4),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.home_filled,
                  label: 'HOME',
                  index: 0,
                ),
                _buildNavItem(
                  icon: Icons.receipt_long,
                  label: 'HISTORY',
                  index: 1,
                ),
                _buildNavItem(
                  icon: Icons.assignment_late,
                  label: 'BOUNTY',
                  index: 2,
                ),
                _buildNavItem(
                  icon: Icons.add_box,
                  label: 'ADD',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.primaryContainer,
                border: Border.all(color: AppColors.tertiary, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                  )
                ],
              )
            : const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.tertiary : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.tertiary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
