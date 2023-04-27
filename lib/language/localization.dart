import 'package:e_commerce/language/ar.dart';
import 'package:e_commerce/language/en.dart';
import 'package:e_commerce/language/fr.dart';
import 'package:e_commerce/utils/my_strings.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    ene : en,
    ara : ar,
    frf : fr
  };

}