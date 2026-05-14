import 'package:flutter/material.dart';
class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final routines = [
      {'icon':'🎮','name':'Gaming Mode','color':0xFFFF6B35,'steps':['DND On','Brightness 90%','RAM Clear']},
      {'icon':'📚','name':'Study Mode','color':0xFF00D4FF,'steps':['Notif Off','Timer 25min','Notes Open']},
      {'icon':'🌙','name':'Sleep Mode','color':0xFF7B2FFF,'steps':['Silent','Brightness 10%','Alarm 7AM']},
      {'icon':'🎬','name':'Movie Mode','color':0xFFFF2D55,'steps':['Brightness 40%','DND On','App Open']},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF080B14),
      appBar: AppBar(backgroundColor: const Color(0xFF0D1220), title: const Text('Routines', style: TextStyle(color: Color(0xFF00D4FF)))),
      body: ListView.builder(
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
            child: Row(children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(r['color'] as int).withOpacity(0.15)),
                child: Center(child: Text(r['icon'] as String, style: const TextStyle(fontSize: 24))),
              ),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(r['name'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 6),
                Wrap(spacing: 6, children: (r['steps'] as List<String>).map((s) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(r['color'] as int).withOpacity(0.15)),
                  child: Text(s, style: TextStyle(fontSize: 10, color: Color(r['color'] as int))),
                )).toList()),
              ])),
              Icon(Icons.play_circle_rounded, color: Color(r['color'] as int), size: 32),
            ]),
          );
        },
      ),
    );
  }
}
