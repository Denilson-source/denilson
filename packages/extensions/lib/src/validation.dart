part of extensions;

extension ValidationExt on String {
  String get capitalized {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isEmail {
    var regex = RegExp("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}");
    return regex.hasMatch(this);
  }

  bool get isAlphanumeric {
    return RegExp("[^a-zA-Z0-9]").hasMatch(this);
  }

  bool get isNumeric {
    return RegExp("[^0-9]").hasMatch(this);
  }

  bool get isValidName {
    return RegExp("[a-zA-Z\\s]+").hasMatch(this);
  }

  bool get isValidPhone {
    return RegExp("\\d{10}\$").hasMatch(this);
  }

  bool get isValidPassword {
    const regex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    return RegExp(regex).hasMatch(this);
  }
}
