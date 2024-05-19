mixin AuthValidation {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email alanı zorunlu';
    }
    final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegEx.hasMatch(value)) {
      return 'Hatalı email formatı';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre alanı zorunlu';
    }
    if (value.length < 6) {
      return 'Şifreniz en az 6 karakter olmalı';
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmValue, String? value) {
    if (value == null || value.isEmpty) {
      return 'Tekrar şifre alanı zorunlu';
    }

    if (value != confirmValue) {
      return 'Şifreler uyuşmuyor';
    }
    return null;
  }

  String? validateSurName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Soyad alanı zorunlu';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad alanı zorunlu';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası alanı zorunlu';
    }
    final phoneRegEx = RegExp(r'^\+?[0-9]{10,12}$');
    if (!phoneRegEx.hasMatch(value)) {
      return 'Geçersiz telefon numarası formatı';
    }
    return null;
  }
}
