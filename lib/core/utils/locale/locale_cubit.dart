import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    // ignore: deprecated_member_use
    final localeCode = prefs.getString('locale') ?? WidgetsBinding.instance.window.locale.languageCode;
    emit(Locale(localeCode));
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    emit(locale);
  }

  void toEnglish() => setLocale(const Locale('en'));

  void toArabic() => setLocale(const Locale('ar'));
}
