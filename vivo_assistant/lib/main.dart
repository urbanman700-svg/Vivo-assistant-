import 'package:flutter/material.dart';

void main() {
  runApp(const VivoApp());
}

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B14),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF),
          secondary: Color(0xFF7B2FFF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _titles = ['Home', 'Chat', 'Routines'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1220),
        title: Text(
          'Vivo Assistant',
          style: const TextStyle(
            color: Color(0xFF00D4FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _currentIndex == 0
          ? _buildHome()
          : _currentIndex == 1
              ? _buildChat()
              : _buildRoutines(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D1220),
        selectedItemColor: const Color(0xFF00D4FF),
        unselectedItemColor: const Color(0xFF6B7A99),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Routines'),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 120, height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D4FF).withOpacity(0.4),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(Icons.assistant, size: 60, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Namaste! Main Vivo hun 👋',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'QUICK ACTIONS',
            style: TextStyle(fontSize: 11, color: Color(0xFF6B7A99), letterSpacing: 2),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _actionCard('🎮', 'Gaming', const Color(0xFFFF6B35)),
              _actionCard('📚', 'Study', const Color(0xFF00D4FF)),
              _actionCard('🌙', 'Sleep', const Color(0xFF7B2FFF)),
              _actionCard('🎬', 'Movie', const Color(0xFFFF2D55)),
              _actionCard('💡', 'Bright', const Color(0xFFFFD60A)),
              _actionCard('🔇', 'Silent', const Color(0xFF6B7A99)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionCard(String emoji, String label, Color color) {
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

  Widget _buildChat() {
    final List<Map<String, String>> messages = [
      {'role': 'ai', 'text': 'Namaste! Main Vivo hun. Kaise help karun? 😊'},
    ];
    final controller = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (ctx, i) {
              final m = messages[i];
              final isUser = m['role'] == 'user';
              return Align(
                alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(ctx).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    gradient: isUser
                        ? const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)])
                        : null,
                    color: isUser ? null : const Color(0xFF0D1220),
                    borderRadius: BorderRadius.circular(16),
                    border: isUser ? null : Border.all(color: Colors.white12),
                  ),
                  child: Text(m['text']!, style: const TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          color: const Color(0xFF0D1220),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Kuch bhi poocho...',
                    hintStyle: const TextStyle(color: Color(0xFF6B7A99)),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 44, height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)]),
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoutines() {
    final routines = [
      {'icon': '🎮', 'name': 'Gaming Mode', 'color': 0xFFFF6B35},
      {'icon': '📚', 'name': 'Study Mode', 'color': 0xFF00D4FF},
      {'icon': '🌙', 'name': 'Sleep Mode', 'color': 0xFF7B2FFF},
      {'icon': '🎬', 'name': 'Movie Mode', 'color': 0xFFFF2D55},
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: routines.length,
      itemBuilder: (ctx, i) {
        final r = routines[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1220),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(r['color'] as int).withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Text(r['icon'] as String, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Text(
                r['name'] as String,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Spacer(),
              Icon(Icons.play_circle, color: Color(r['color'] as int), size: 32),
            ],
          ),
        );
      },
    );
  }
}
