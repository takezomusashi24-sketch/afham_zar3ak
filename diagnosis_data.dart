class DiagnosisResult {
  final String title;
  final String reason;
  final List<String> solution;
  final String emoji;

  const DiagnosisResult({
    required this.title,
    required this.reason,
    required this.solution,
    required this.emoji,
  });
}

class DiagnosisQuestion {
  final String question;
  final List<DiagnosisOption> options;

  const DiagnosisQuestion({
    required this.question,
    required this.options,
  });
}

class DiagnosisOption {
  final String label;
  final String? nextQuestionId;
  final DiagnosisResult? result;

  const DiagnosisOption({
    required this.label,
    this.nextQuestionId,
    this.result,
  });
}

// ─── Decision Tree ───────────────────────────────────────────────────────────

final Map<String, DiagnosisQuestion> diagnosisTree = {
  'start': DiagnosisQuestion(
    question: 'ما هي المشكلة التي تلاحظها على نبتتك؟',
    options: [
      DiagnosisOption(label: '🍂 أوراق صفراء', nextQuestionId: 'yellow'),
      DiagnosisOption(label: '🥀 النبتة ذابلة', nextQuestionId: 'wilt'),
      DiagnosisOption(label: '🔴 بقع على الأوراق', nextQuestionId: 'spots'),
      DiagnosisOption(label: '🐌 نمو بطيء', nextQuestionId: 'slow'),
    ],
  ),

  // ── Yellow Leaves ──────────────────────────────────────────────
  'yellow': DiagnosisQuestion(
    question: 'هل التربة مبللة جداً أو جافة جداً؟',
    options: [
      DiagnosisOption(label: '💧 مبللة جداً', nextQuestionId: 'yellow_wet'),
      DiagnosisOption(label: '🏜️ جافة جداً', result: DiagnosisResult(
        title: 'نقص الماء',
        reason: 'النبتة تعاني من عطش! الجفاف يسبب اصفرار الأوراق وتساقطها.',
        solution: [
          'اسقِ النبتة فوراً بكمية معتدلة من الماء',
          'تأكد من أن التربة رطبة وليست مشبعة بالماء',
          'ضع روتيناً منتظماً للسقي (مرة كل ٢-٣ أيام صيفاً)',
          'تحقق من أن الأصيص له ثقوب تصريف',
        ],
        emoji: '💧',
      )),
      DiagnosisOption(label: '👍 رطوبة مناسبة', nextQuestionId: 'yellow_light'),
    ],
  ),

  'yellow_wet': DiagnosisQuestion(
    question: 'هل جذور النبتة تبدو بنية أو سوداء اللون؟',
    options: [
      DiagnosisOption(label: '✅ نعم، جذور داكنة', result: DiagnosisResult(
        title: 'تعفن الجذور',
        reason: 'الإفراط في السقي أدى إلى تعفن الجذور، وهذا يمنع النبتة من امتصاص الغذاء.',
        solution: [
          'أوقف السقي فوراً لعدة أيام',
          'أخرج النبتة من الأصيص وافحص الجذور',
          'اقطع الجذور المتعفنة (البنية والطرية) بمقص معقم',
          'أعد الزراعة في تربة جديدة جافة',
          'انتظر أسبوعاً قبل السقي مجدداً',
        ],
        emoji: '🌱',
      )),
      DiagnosisOption(label: '❌ لا، جذور طبيعية', result: DiagnosisResult(
        title: 'زيادة السقي',
        reason: 'التربة المبللة دائماً تخنق الجذور وتمنع التنفس مما يصفر الأوراق.',
        solution: [
          'قلل كمية الماء بمقدار النصف',
          'اسقِ فقط عندما تجف السطحية من التربة ٢-٣ سم',
          'تأكد من وجود ثقوب تصريف في الأصيص',
          'استخدم تربة خلطة جيدة التهوية',
        ],
        emoji: '🚿',
      )),
    ],
  ),

  'yellow_light': DiagnosisQuestion(
    question: 'هل النبتة تحصل على ضوء شمس كافٍ؟',
    options: [
      DiagnosisOption(label: '🌑 ضوء قليل جداً', result: DiagnosisResult(
        title: 'نقص الضوء',
        reason: 'الضوء ضروري للبناء الضوئي. بدون ضوء كافٍ تفقد الأوراق لونها الأخضر.',
        solution: [
          'انقل النبتة لمكان أكثر إضاءة',
          'ضعها قرب نافذة تطل على الشمال أو الشرق',
          'إذا لم يتوفر ضوء طبيعي، استخدم مصباح نمو للنباتات',
          'لا تضعها في ركن مظلم تماماً',
        ],
        emoji: '☀️',
      )),
      DiagnosisOption(label: '☀️ ضوء كافٍ', result: DiagnosisResult(
        title: 'نقص العناصر الغذائية',
        reason: 'الاصفرار مع الضوء والسقي الجيد يشير لنقص عناصر غذائية كالنيتروجين أو الحديد.',
        solution: [
          'أضف سماداً متوازناً مرة في الشهر',
          'جرب سماداً يحتوي على الحديد والنيتروجين',
          'يمكن استخدام سماد عضوي مثل سماد الدبال',
          'تحقق من درجة حموضة التربة (pH يجب ٦-٧)',
        ],
        emoji: '🌿',
      )),
    ],
  ),

  // ── Wilting ────────────────────────────────────────────────────
  'wilt': DiagnosisQuestion(
    question: 'متى آخر مرة سقيت النبتة؟',
    options: [
      DiagnosisOption(label: '🕐 من أكثر من أسبوع', result: DiagnosisResult(
        title: 'عطش شديد',
        reason: 'النبتة في حالة إجهاد مائي حاد. فقدان المياه أدى لذبول الأوراق والساق.',
        solution: [
          'اسقِ النبتة فوراً بشكل غزير',
          'ضع الأصيص في وعاء ماء لـ ٣٠ دقيقة ليمتص الماء من أسفل',
          'رش الأوراق بالماء قليلاً',
          'ضعها في مكان ظليل مؤقتاً لتتعافى',
          'ضع تذكير منتظم للسقي',
        ],
        emoji: '💦',
      )),
      DiagnosisOption(label: '📅 سقيتها مؤخراً', nextQuestionId: 'wilt_recent'),
    ],
  ),

  'wilt_recent': DiagnosisQuestion(
    question: 'هل الجو حار جداً أو التربة تجف بسرعة؟',
    options: [
      DiagnosisOption(label: '🌡️ نعم، حر شديد', result: DiagnosisResult(
        title: 'إجهاد حراري',
        reason: 'الحرارة الشديدة تتبخر المياه بسرعة وتضغط على النبتة مما يسبب الذبول.',
        solution: [
          'انقل النبتة لمكان أكثر برودة وظلاً',
          'زد تكرار السقي في الصيف',
          'ضع طبقة من المالش (قش أو حجارة) فوق التربة للحفاظ على الرطوبة',
          'رش الأوراق بالماء صباحاً',
        ],
        emoji: '🌡️',
      )),
      DiagnosisOption(label: '❌ لا، الجو معتدل', result: DiagnosisResult(
        title: 'تعفن الجذور أو مرض',
        reason: 'الذبول مع الري الكافي والجو المعتدل قد يشير لتعفن الجذور أو مرض فطري.',
        solution: [
          'افحص الجذور - إذا كانت بنية وطرية فهي متعفنة',
          'اقطع الجذور التالفة بمقص معقم',
          'أعد الزراعة في تربة جديدة معقمة',
          'استخدم مبيد فطري خفيف إذا لزم الأمر',
          'قلل السقي وحسن التهوية',
        ],
        emoji: '🔬',
      )),
    ],
  ),

  // ── Spots ──────────────────────────────────────────────────────
  'spots': DiagnosisQuestion(
    question: 'ما لون البقع على الأوراق؟',
    options: [
      DiagnosisOption(label: '🟤 بنية أو سوداء', nextQuestionId: 'spots_brown'),
      DiagnosisOption(label: '⬜ بيضاء أو رمادية', result: DiagnosisResult(
        title: 'مرض البياض الدقيقي',
        reason: 'البقع البيضاء الطحينية هي فطر يسمى البياض الدقيقي، ينتشر في الرطوبة العالية.',
        solution: [
          'عزل النبتة عن النباتات الأخرى فوراً',
          'ارش محلول من الماء + بيكربونات الصوديوم (ملعقة صغيرة لكوب ماء)',
          'قطع الأوراق الشديدة الإصابة',
          'حسّن تهوية المكان وقلل الرطوبة',
          'تجنب رش الأوراق بالماء مساءً',
        ],
        emoji: '🍄',
      )),
      DiagnosisOption(label: '🟡 صفراء أو برتقالية', result: DiagnosisResult(
        title: 'صدأ النباتات',
        reason: 'البقع الصفراء/البرتقالية تحت الأوراق هي فطر الصدأ، يحتاج رطوبة لينتشر.',
        solution: [
          'اقطع الأوراق المصابة بمقص معقم وتخلص منها',
          'لا تسقِ من فوق الأوراق، فقط التربة',
          'استخدم مبيد فطري نحاسي',
          'حسّن التهوية حول النبتة',
        ],
        emoji: '🍂',
      )),
    ],
  ),

  'spots_brown': DiagnosisQuestion(
    question: 'هل البقع البنية جافة أم رطبة وطرية؟',
    options: [
      DiagnosisOption(label: '🌵 جافة ومقعرة', result: DiagnosisResult(
        title: 'حروق الشمس أو نقص الماء',
        reason: 'البقع الجافة البنية تشير لحروق الشمس المباشرة أو جفاف متكرر للنبتة.',
        solution: [
          'ابعد النبتة عن الشمس المباشرة في الظهيرة',
          'انقلها لمكان بإضاءة غير مباشرة',
          'اسقِ بانتظام أكثر',
          'أوراق محترقة لن تتعافى، يمكن إزالتها',
        ],
        emoji: '☀️',
      )),
      DiagnosisOption(label: '💧 رطبة وطرية', result: DiagnosisResult(
        title: 'مرض فطري بكتيري',
        reason: 'البقع الرطبة الطرية تدل على إصابة فطرية أو بكتيرية، وتنتشر بالرطوبة.',
        solution: [
          'اقطع الأوراق المصابة فوراً',
          'لا ترش الأوراق بالماء',
          'استخدم مبيداً فطرياً من محل الزراعة',
          'حسّن التهوية وقلل الرطوبة المحيطة',
          'عزل النبتة عن باقي النباتات',
        ],
        emoji: '🧫',
      )),
    ],
  ),

  // ── Slow Growth ────────────────────────────────────────────────
  'slow': DiagnosisQuestion(
    question: 'كم عمر النبتة في نفس الأصيص؟',
    options: [
      DiagnosisOption(label: '📅 أكثر من سنتين', result: DiagnosisResult(
        title: 'الجذور ملأت الأصيص',
        reason: 'عندما تملأ الجذور الأصيص لا يبقى مكان للنمو، وتستنفد الجذور كل التربة والغذاء.',
        solution: [
          'انقل النبتة لأصيص أكبر بـ ٥-٧ سم',
          'استخدم تربة جديدة وطازجة',
          'أضف سماداً بطيء الإفراز عند إعادة الزراعة',
          'أفضل وقت لنقل النبتة: الربيع والخريف',
        ],
        emoji: '🪴',
      )),
      DiagnosisOption(label: '🌱 أقل من سنتين', nextQuestionId: 'slow_young'),
    ],
  ),

  'slow_young': DiagnosisQuestion(
    question: 'هل تضيف سماداً للنبتة بانتظام؟',
    options: [
      DiagnosisOption(label: '❌ لا، لا أسمّد', result: DiagnosisResult(
        title: 'نقص الغذاء',
        reason: 'التربة تفقد عناصرها الغذائية مع الوقت، والنبتة تحتاج "وجبات" منتظمة لتنمو.',
        solution: [
          'أضف سماداً سائلاً متوازناً مرة في الشهر',
          'في فصل النمو (الربيع والصيف) سمّد كل ٢-٣ أسابيع',
          'توقف عن التسميد في الشتاء',
          'لا تُبالغ في السماد - الزيادة ضارة',
        ],
        emoji: '🌿',
      )),
      DiagnosisOption(label: '✅ نعم، أسمّد', result: DiagnosisResult(
        title: 'ضوء غير كافٍ',
        reason: 'النمو البطيء مع التسميد الجيد يشير غالباً لنقص الضوء اللازم للبناء الضوئي.',
        solution: [
          'انقل النبتة لمكان أكثر إضاءة طبيعية',
          'ضعها قرب نافذة تحصل على ٤-٦ ساعات ضوء يومياً',
          'بعض النباتات تحتاج شمساً مباشرة وبعضها ضوءاً غير مباشر',
          'ابحث عن متطلبات الضوء الخاصة بنوع نبتتك',
        ],
        emoji: '🌤️',
      )),
    ],
  ),
};
