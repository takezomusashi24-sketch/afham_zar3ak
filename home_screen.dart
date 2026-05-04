import 'package:flutter/material.dart';
import 'diagnose_screen.dart';
import 'basics_screen.dart';
import 'mistakes_screen.dart';
import 'plant_now_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 36),
              _buildMainButton(
                context,
                emoji: '🔍',
                title: 'تشخيص نبتتك',
                subtitle: 'اكتشف ما تعاني منه نبتتك',
                color: const Color(0xFF2E7D32),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DiagnoseScreen())),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildSmallButton(
                      context,
                      emoji: '📚',
                      title: 'تعلم الأساسيات',
                      color: const Color(0xFF388E3C),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const BasicsScreen())),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSmallButton(
                      context,
                      emoji: '⚠️',
                      title: 'أخطاء قاتلة',
                      color: const Color(0xFFC62828),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const MistakesScreen())),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildMainButton(
                context,
                emoji: '🌱',
                title: 'ماذا تزرع الآن؟',
                subtitle: 'نباتات مناسبة لهذا الموسم',
                color: const Color(0xFF558B2F),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PlantNowScreen())),
              ),
              const SizedBox(height: 30),
              _buildTip(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2E7D32).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Text('🌿', style: TextStyle(fontSize: 40)),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'افهم زرعك',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        const Text(
          'رفيقك في رعاية النباتات 🌱',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF558B2F),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMainButton(
    BuildContext context, {
    required String emoji,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 36)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallButton(
    BuildContext context, {
    required String emoji,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF81C784), width: 1.5),
      ),
      child: const Row(
        children: [
          Text('💡', style: TextStyle(fontSize: 24)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'نصيحة اليوم: معظم النباتات تموت من الإفراط في السقي وليس من النسيان!',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF2E7D32),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
