import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _ctrl = TextEditingController();
  bool _loading = false;
  void _send(String text) {
    if (text.trim().isEmpty) return;
    setState(() { _messages.add({'role':'user','text':text}); _loading = true; _ctrl.clear(); });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() { _messages.add({'role':'ai','text':'Namaste! Main Vivo hun. Internet connect karo AI ke liye. Abhi offline mode mein hun.'}); _loading = false; });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080B14),
      appBar: AppBar(backgroundColor: const Color(0xFF0D1220), title: const Text('Vivo AI', style: TextStyle(color: Color(0xFF00D4FF)))),
      body: Column(children: [
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _messages.length,
          itemBuilder: (ctx, i) {
            final m = _messages[i];
            final isUser = m['role'] == 'user';
            return Align(
              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                decoration: BoxDecoration(
                  gradient: isUser ? const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)]) : null,
                  color: isUser ? null : const Color(0xFF0D1220),
                  borderRadius: BorderRadius.circular(16),
                  border: isUser ? null : Border.all(color: Colors.white12),
                ),
                child: Text(m['text']!, style: const TextStyle(color: Colors.white, fontSize: 13)),
              ),
            );
          },
        )),
        if (_loading) const LinearProgressIndicator(color: Color(0xFF00D4FF)),
        Container(
          padding: const EdgeInsets.all(12),
          color: const Color(0xFF0D1220),
          child: Row(children: [
            Expanded(child: TextField(
              controller: _ctrl,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Kuch bhi poocho...',
                hintStyle: const TextStyle(color: Color(0xFF6B7A99)),
                filled: true, fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onSubmitted: _send,
            )),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _send(_ctrl.text),
              child: Container(
                width: 44, height: 44,
                decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7B2FFF)])),
                child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
