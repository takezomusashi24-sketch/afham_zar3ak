import 'package:flutter/material.dart';

class _Tip {
  final String emoji;
  final String title;
  final String body;
  const _Tip(this.emoji, this.title, this.body);
}

const _tips = [
  _Tip('💧', 'السقي الصحيح',
      'اسقِ عندما تجف التربة السطحية ٢-٣ سم. معظم النباتات تموت من كثرة الماء لا من قلته. تحقق دائماً بإدخال إصبعك في التربة.'),
  _Tip('☀️', 'الضوء المناسب',
      'كل نبتة تحتاج كمية مختلفة من الضوء. النباتات الاستوائية تحب الضوء غير المباشر، أما الصواريخ والصبر فتحتاج شمساً مباشرة.'),
  _Tip('🌱', 'التربة الجيدة',
      'التربة الجيدة تكون خفيفة وجيدة التصريف. أضف البرلايت أو الرمل الخشن لتحسين التهوية ومنع تعفن الجذور.'),
  _Tip('🪴', 'وقت نقل الأصيص',
      'انقل النبتة لأصيص أكبر عندما ترى الجذور تخرج من ثقوب التصريف أو عندما يتوقف النمو. الربيع هو أفضل وقت.'),
  _Tip('🌡️', 'درجة الحرارة',
      'معظم النباتات المنزلية تحب ١٨-٢٦ درجة. تجنب وضعها قرب مكيفات الهواء أو مصادر الحرارة المباشرة.'),
  _Tip('🌿', 'التسميد',
      'سمّد نباتاتك مرة في الشهر في فصل النمو (ربيع وصيف). لا تسمّد في الشتاء عندما تكون النبتة في حالة راحة.'),
];

class BasicsScreen extends StatelessWidget {
  const BasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF388E3C),
        foregroundColor: Colors.white,
        title: const Text('تعلم الأساسيات',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tips.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF388E3C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '🌱 أساسيات النجاح مع النباتات',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final tip = _tips[i - 1];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(tip.emoji,
                          style: const TextStyle(fontSize: 26))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tip.title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B5E20))),
                      const SizedBox(height: 6),
                      Text(tip.body,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF546E7A),
                              height: 1.6)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
