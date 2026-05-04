import 'package:flutter/material.dart';

class _Plant {
  final String emoji;
  final String name;
  final String desc;
  final String difficulty;
  final Color diffColor;
  const _Plant(this.emoji, this.name, this.desc, this.difficulty, this.diffColor);
}

const _springPlants = [
  _Plant('🌿', 'النعناع', 'ينمو بسرعة ويحتاج ضوءاً جيداً وسقياً منتظماً. مثالي للشرفة.', 'سهل جداً', Color(0xFF2E7D32)),
  _Plant('🌹', 'الورد', 'يحتاج شمساً مباشرة ٦ ساعات. الربيع هو أفضل وقت لزراعته.', 'متوسط', Color(0xFFF57C00)),
  _Plant('🫑', 'الفلفل', 'نبتة منتجة رائعة للشرفات. تحتاج دفئاً وشمساً وسقياً منتظماً.', 'سهل', Color(0xFF388E3C)),
  _Plant('🌻', 'عباد الشمس', 'ينمو بسرعة مذهلة ويحتاج شمساً مباشرة. مبهج ومميز.', 'سهل جداً', Color(0xFF2E7D32)),
];

const _allSeasonPlants = [
  _Plant('🌵', 'الصبار', 'لا يحتاج تقريباً أي عناية. مثالي للمبتدئين.', 'سهل جداً', Color(0xFF2E7D32)),
  _Plant('🪴', 'البوتس', 'نبتة خضراء جميلة تتحمل الإهمال وتنمو في أي ضوء.', 'سهل جداً', Color(0xFF2E7D32)),
  _Plant('🌿', 'الألوفيرا', 'نبتة طبية رائعة. تحتاج ضوءاً جيداً وسقياً نادراً.', 'سهل جداً', Color(0xFF2E7D32)),
  _Plant('🌱', 'السانسيفيريا', 'تتحمل الجفاف والظل. مثالية للداخل.', 'سهل جداً', Color(0xFF2E7D32)),
];

class PlantNowScreen extends StatelessWidget {
  const PlantNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF558B2F),
        foregroundColor: Colors.white,
        title: const Text('ماذا تزرع الآن؟',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionHeader('🌸 مناسبة للربيع والصيف'),
          const SizedBox(height: 12),
          ..._springPlants.map((p) => _buildPlantCard(p)),
          const SizedBox(height: 8),
          _sectionHeader('🌍 مناسبة طوال السنة'),
          const SizedBox(height: 12),
          ..._allSeasonPlants.map((p) => _buildPlantCard(p)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF558B2F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '💡 نصيحة: ابدأ بنبتة سهلة وابنِ ثقتك أولاً. النجاح مع نبتة واحدة أفضل من فشل مع عشر!',
              style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1B5E20),
      ),
    );
  }

  Widget _buildPlantCard(_Plant p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
                child: Text(p.emoji, style: const TextStyle(fontSize: 30))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(p.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E20))),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: p.diffColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(p.difficulty,
                          style: TextStyle(
                              fontSize: 11,
                              color: p.diffColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(p.desc,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF607D8B),
                        height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
