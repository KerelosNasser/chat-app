class InputValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegEx.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age cannot be empty';
    }
    final age = int.tryParse(value);
    if (age == null || age < 18) {
      return 'Enter a valid age (18 or older)';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
