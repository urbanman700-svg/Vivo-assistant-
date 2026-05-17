import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _tab = 0;
  late AnimationController _orb;

  @override
  void initState() {
    super.initState();
    _orb = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _orb.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080B14),
      body: IndexedStack(
        index: _tab,
        children: const [
          _HomeTab(),
          _ChatTab(),
          _RoutinesTab(),
          _SettingsTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF0D1220),
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.flash_on_rounded),
            label: 'Routines',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              '✦ Vivo Assistant',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D4FF),
              ),
            ),
            const Text(
              'Namaste! Kaise help karun? 👋',
              style: TextStyle(color: Color(0xFF6B7A99), fontSize: 14),
            ),
            const SizedBox(height: 30),
            Container(
              width: 120,
              height: 120,
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
              child: const Icon(
                Icons.assistant,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '● AI Active',
              style: TextStyle(
                color: Color(0xFF00FF88),
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 30),
            const _SectionLabel('QUICK ACTIONS'),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.5,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _ActionBtn('🎮 Gaming', Color(0xFFFF6B35)),
                _ActionBtn('📚 Study', Color(0xFF00D4FF)),
                _ActionBtn('🌙 Sleep', Color(0xFF7B2FFF)),
                _ActionBtn('🎬 Movie', Color(0xFFFF2D55)),
                _ActionBtn('🔦 Flash', Color(0xFFFFD60A)),
                _ActionBtn('🔇 Silent', Color(0xFF6B7A99)),
              ],
            ),
            const SizedBox(height: 20),
            const _SectionLabel('VOICE COMMAND'),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mic, color: Color(0xFF080B14)),
                label: const Text(
                  'Bolein — Hey Vivo',
                  style: TextStyle(
                    color: Color(0xFF080B14),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF6B7A99),
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final Color color;
  const _ActionBtn(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D1220),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: color.withOpacity(0.3)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _ChatTab extends StatefulWidget {
  const _ChatTab();

  @override
  State<_ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<_ChatTab> {
  final List<Map<String, String>> _msgs = [
    {'role': 'ai', 'text': 'Namaste! Main Vivo hun. Kaise help karun? 😊'},
  ];
  final _ctrl = TextEditingController();
  bool _loading = false;

  void _send() {
    if (_ctrl.text.trim().isEmpty) return;
    setState(() {
      _msgs.add({'role': 'user', 'text': _ctrl.text});
      _loading = true;
    });
    _ctrl.clear();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _msgs.add({
          'role': 'ai',
          'text': 'Settings mein Gemini API Key add karo AI chat ke liye!',
        });
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
          color: const Color(0xFF0D1220),
          child: const Row(
            children: [
              Text(
                '✦ Vivo AI Chat',
                style: TextStyle(
                  color: Color(0xFF00D4FF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '● Online',
                style: TextStyle(color: Color(0xFF00FF88), fontSize: 12),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _msgs.length,
            itemBuilder: (ctx, i) {
              final m = _msgs[i];
              final isUser = m['role'] == 'user';
              return Align(
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(ctx).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    gradient: isUser
                        ? const LinearGradient(
                            colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)],
                          )
                        : null,
                    color: isUser ? null : const Color(0xFF0D1220),
                    borderRadius: BorderRadius.circular(16),
                    border: isUser
                        ? null
                        : Border.all(color: Colors.white12),
                  ),
                  child: Text(
                    m['text']!,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              );
            },
          ),
        ),
        if (_loading)
          const LinearProgressIndicator(color: Color(0xFF00D4FF)),
        Container(
          padding: const EdgeInsets.all(12),
          color: const Color(0xFF0D1220),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ctrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Kuch bhi poocho...',
                    hintStyle:
                        const TextStyle(color: Color(0xFF6B7A99)),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (_) => _send(),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _send,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)],
                    ),
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoutinesTab extends StatelessWidget {
  const _RoutinesTab();

  @override
  Widget build(BuildContext context) {
    final routines = [
      {'icon': '🎮', 'name': 'Gaming Mode', 'color': 0xFFFF6B35,
        'desc': 'DND On • Brightness 90% • Notif Off'},
      {'icon': '📚', 'name': 'Study Mode', 'color': 0xFF00D4FF,
        'desc': 'Notif Off • Focus Timer • Calm'},
      {'icon': '🌙', 'name': 'Sleep Mode', 'color': 0xFF7B2FFF,
        'desc': 'Silent • Brightness 10% • DND'},
      {'icon': '🎬', 'name': 'Movie Mode', 'color': 0xFFFF2D55,
        'desc': 'Brightness 40% • DND • Immersive'},
    ];
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              '⚡ Smart Routines',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D4FF),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: routines.length,
              itemBuilder: (ctx, i) {
                final r = routines[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1220),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(r['color'] as int).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        r['icon'] as String,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              r['name'] as String,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(r['color'] as int),
                              ),
                            ),
                            Text(
                              r['desc'] as String,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF6B7A99),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.play_circle_rounded,
                        color: Color(r['color'] as int),
                        size: 32,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTab extends StatelessWidget {
  const _SettingsTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '⚙️ Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D4FF),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '🔑 GEMINI API KEY',
              style: TextStyle(
                color: Color(0xFF00D4FF),
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'API Key dalein...',
                hintStyle: const TextStyle(color: Color(0xFF6B7A99)),
                filled: true,
                fillColor: const Color(0xFF0D1220),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  '💾 Save API Key',
                  style: TextStyle(
                    color: Color(0xFF080B14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Free key: aistudio.google.com',
              style: TextStyle(color: Color(0xFF6B7A99), fontSize: 12),
            ),
            const SizedBox(height: 24),
            const Text(
              'ℹ️ ABOUT',
              style: TextStyle(
                color: Color(0xFF00D4FF),
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Vivo Assistant v1.0\nBy CodeXKD\nSnapdragon 425 Optimized\nAndroid 8.1+',
              style: TextStyle(color: Color(0xFF6B7A99), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
