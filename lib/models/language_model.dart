class LanguageModel {
  final String name;
  final String code;

  LanguageModel({required this.name, required this.code});

  static List<LanguageModel> languages = [
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(name: 'العربية', code: 'ar'),
  ];
}
