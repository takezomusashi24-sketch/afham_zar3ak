import 'package:flutter/material.dart';
import '../data/diagnosis_data.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({super.key});

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen>
    with SingleTickerProviderStateMixin {
  String _currentQuestionId = 'start';
  DiagnosisResult? _result;
  final List<String> _breadcrumb = [];
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onOptionTap(DiagnosisOption option) {
    _animController.reverse().then((_) {
      setState(() {
        _breadcrumb.add(_currentQuestionId);
        if (option.result != null) {
          _result = option.result;
        } else if (option.nextQuestionId != null) {
          _currentQuestionId = option.nextQuestionId!;
        }
      });
      _animController.forward();
    });
  }

  void _goBack() {
    if (_breadcrumb.isEmpty) {
      Navigator.pop(context);
      return;
    }
    _animController.reverse().then((_) {
      setState(() {
        _result = null;
        _currentQuestionId = _breadcrumb.removeLast();
      });
      _animController.forward();
    });
  }

  void _restart() {
    _animController.reverse().then((_) {
      setState(() {
        _currentQuestionId = 'start';
        _result = null;
        _breadcrumb.clear();
      });
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        title: const Text(
          'تشخيص نبتتك',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: _goBack,
        ),
        elevation: 0,
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: _result != null
            ? _buildResult(_result!)
            : _buildQuestion(diagnosisTree[_currentQuestionId]!),
      ),
    );
  }

  Widget _buildQuestion(DiagnosisQuestion question) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_breadcrumb.isNotEmpty) _buildProgressBar(),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2E7D32).withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text('❓', style: TextStyle(fontSize: 40)),
                const SizedBox(height: 12),
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'اختر الإجابة الأقرب لحالتك:',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF558B2F),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ...question.options.map((option) => _buildOptionButton(option)),
        ],
      ),
    );
  }

  Widget _buildOptionButton(DiagnosisOption option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => _onOptionTap(option),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF81C784), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  option.label,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFF1B5E20),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_back_ios_new,
                  color: Color(0xFF66BB6A), size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        const Text('التقدم: ', style: TextStyle(color: Color(0xFF558B2F), fontSize: 13)),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: _breadcrumb.length / 4.0,
              backgroundColor: const Color(0xFFC8E6C9),
              color: const Color(0xFF2E7D32),
              minHeight: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult(DiagnosisResult result) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Result header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2E7D32).withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(result.emoji, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 12),
                const Text(
                  '🔍 التشخيص',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  result.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Reason
          _buildCard(
            icon: '💡',
            title: 'السبب',
            child: Text(
              result.reason,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF37474F),
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Solution
          _buildCard(
            icon: '✅',
            title: 'الحل خطوة بخطوة',
            child: Column(
              children: result.solution.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E7D32),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${entry.key + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF37474F),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Action buttons
          ElevatedButton.icon(
            onPressed: _restart,
            icon: const Icon(Icons.refresh),
            label: const Text('تشخيص مشكلة أخرى',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home_outlined),
            label: const Text('الرئيسية',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2E7D32),
              side: const BorderSide(color: Color(0xFF2E7D32), width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ),
              ),
            ],
          ),
          const Divider(height: 20, color: Color(0xFFE8F5E9)),
          child,
        ],
      ),
    );
  }
}
