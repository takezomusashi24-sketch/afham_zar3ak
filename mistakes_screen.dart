import 'package:flutter/material.dart';

class _Mistake {
  final String emoji;
  final String title;
  final String why;
  final String fix;
  const _Mistake(this.emoji, this.title, this.why, this.fix);
}

const _mistakes = [
  _Mistake(
    '💀',
    'الإفراط في السقي',
    'أكثر سبب وفاة للنباتات! الجذور تحتاج هواء، والتربة المبللة دائماً تخنقها وتسبب التعفن.',
    'اسقِ فقط عندما تجف التربة السطحية. ضع إصبعك ٢ سم في التربة - إذا كانت رطبة، لا تسقِ.',
  ),
  _Mistake(
    '🌑',
    'وضع النبتة في الظلام',
    'النباتات تصنع غذاءها من الضوء. بدون ضوء كافٍ تضعف وتصفر أوراقها ثم تموت ببطء.',
    'ضع نباتاتك قرب النوافذ. حتى النباتات التي تتحمل الظل تحتاج لضوء غير مباشر.',
  ),
  _Mistake(
    '🚫',
    'نقل الأصيص في الشتاء',
    'الشتاء هو وقت الراحة للنبات. نقله يسبب صدمة وإجهاداً حين يكون في أضعف حالاته.',
    'انتظر الربيع دائماً لنقل النباتات. هذا يضمن تعافياً سريعاً وبداية نمو قوية.',
  ),
  _Mistake(
    '🧪',
    'الإفراط في التسميد',
    'الزيادة في السماد تحرق الجذور وتسبب ما يسمى "حرق السماد" - علامته تحول أطراف الأوراق للبني.',
    'اتبع التعليمات على العبوة، والأفضل تخفيف الجرعة لنصفها. أقل دائماً أفضل.',
  ),
  _Mistake(
    '🌡️',
    'وضعها قرب المكيف',
    'الهواء البارد المباشر يسبب صدمة حرارية للنباتات الاستوائية ويجفف أوراقها.',
    'ابعد النباتات مسافة ١-٢ متر على الأقل عن فتحات التكييف والمدافئ.',
  ),
  _Mistake(
    '🪣',
    'ترك الماء في الطبق',
    'الطبق المملوء بالماء يجعل الجذور تجلس في الماء باستمرار مما يسبب تعفنها.',
    'اسكب الماء الزائد من الطبق بعد ٣٠ دقيقة من السقي دائماً.',
  ),
];

class MistakesScreen extends StatelessWidget {
  const MistakesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        foregroundColor: Colors.white,
        title: const Text('أخطاء قاتلة',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mistakes.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFC62828),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  '⚠️ أخطاء تقتل نباتاتك بصمت',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final m = _mistakes[i - 1];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 14),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEBEE),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      Text(m.emoji,
                          style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(m.title,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB71C1C))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(children: [
                        Icon(Icons.error_outline,
                            color: Color(0xFFE53935), size: 16),
                        SizedBox(width: 6),
                        Text('لماذا خطر؟',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE53935),
                                fontSize: 13)),
                      ]),
                      const SizedBox(height: 4),
                      Text(m.why,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF546E7A),
                              height: 1.5)),
                      const SizedBox(height: 12),
                      const Row(children: [
                        Icon(Icons.check_circle_outline,
                            color: Color(0xFF2E7D32), size: 16),
                        SizedBox(width: 6),
                        Text('الحل:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32),
                                fontSize: 13)),
                      ]),
                      const SizedBox(height: 4),
                      Text(m.fix,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF546E7A),
                              height: 1.5)),
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
