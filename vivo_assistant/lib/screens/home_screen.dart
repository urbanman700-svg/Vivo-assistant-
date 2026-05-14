import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'routines_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _orbController;

  @override
  void initState() {
    super.initState();
    _orbController = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
  }

  @override
  void dispose() {
    _orbController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = const [HomeTab(), ChatScreen(), RoutinesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF0D1220),
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.chat_rounded), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.flash_on_rounded), label: 'Routines'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Namaste! 👋', style: TextStyle(fontSize: 14, color: Color(0xFF6B7A99))),
            const Text('Vivo Assistant', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF))),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 120, height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)]),
                  boxShadow: [BoxShadow(color: const Color(0xFF00D4FF).withOpacity(0.4), blurRadius: 30, spreadRadius: 5)],
                ),
                child: const Icon(Icons.assistant, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const Text('QUICK ACTIONS', style: TextStyle(fontSize: 11, color: Color(0xFF6B7A99), letterSpacing: 2)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _ActionCard('🎮', 'Gaming', const Color(0xFFFF6B35)),
                _ActionCard('📚', 'Study', const Color(0xFF00D4FF)),
                _ActionCard('🌙', 'Sleep', const Color(0xFF7B2FFF)),
                _ActionCard('🎬', 'Movie', const Color(0xFFFF2D55)),
                _ActionCard('💡', 'Bright', const Color(0xFFFFD60A)),
                _ActionCard('🔇', 'Silent', const Color(0xFF6B7A99)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _ActionCard(String emoji, String label, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF0D1220),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.08)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
      ],
    ),
  );
}
