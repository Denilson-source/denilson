part of extensions;

extension MaskExt on String {
  /// 000.000.000-00
  String get toCpf {
    String value = replaceAllMapped(RegExp(r'\D'), (m) => "");

    return value
        .replaceFirstMapped(RegExp(r'(\d{3})(\d)'), (m) => "${m[1]}.${m[2]}")
        .replaceFirstMapped(RegExp(r'(\d{3})(\d)'), (m) => "${m[1]}.${m[2]}")
        .replaceFirstMapped(RegExp(r'(\d{3})(\d{1,2})'), (m) => "${m[1]}-${m[2]}")
        .replaceFirstMapped(RegExp(r'(-\d{2})\d+?$'), (m) => "${m[1]}");
  }

  /// length <= 8  - 0000-0000
  ///
  /// length <= 9  - 00000-0000
  ///
  /// length <= 10 - (00) 0000-0000
  ///
  /// length <= 11 - (00) 00000-0000
  ///
  /// length > 11  - 00000000...
  String get toPhoneBR {
    String value = replaceAllMapped(RegExp(r'\D'), (m) => "");

    // 0000-0000
    if (value.length <= 8) {
      return value.replaceAllMapped(
        RegExp(r'(\d{4})(\d)'),
        (m) => '${m[1]}-${m[2]}',
      );
    }

    // 00000-0000
    if (value.length <= 9) {
      return value.replaceAllMapped(
        RegExp(r'(\d{5})(\d)'),
        (m) => '${m[1]}-${m[2]}',
      );
    }

    // (00) 0000-0000
    if (value.length <= 10) {
      return value.replaceAllMapped(
        RegExp(r'(\d{2})(\d{4})(\d{4})'),
        (m) => '(${m[1]}) ${m[2]}-${m[3]}',
      );
    }

    // (00) 00000-0000
    if (value.length <= 11) {
      return value.replaceAllMapped(
        RegExp(r'(\d{2})(\d{5})(\d{4})'),
        (m) => '(${m[1]}) ${m[2]}-${m[3]}',
      );
    }

    return value;
  }

  /// (000) 000-0000...
  String get toPhoneUS {
    String value = replaceAllMapped(RegExp(r'\D'), (m) => "");

    // (000) 000-0000
    return value
        .replaceFirstMapped(RegExp(r'(\d{3})(\d)'), (m) => '(${m[1]}) ${m[2]}')
        .replaceFirstMapped(RegExp(r'(\d{3})(\d)'), (m) => '${m[1]}-${m[2]}');
  }
}
