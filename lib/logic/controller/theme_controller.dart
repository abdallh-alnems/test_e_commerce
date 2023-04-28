import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

  void saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFormBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  // ignore: non_constant_identifier_names
  ThemeMode get ThemeDataGet =>
      getThemeDataFormBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFormBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFormBox());
  }
}
