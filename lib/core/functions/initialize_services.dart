import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

initializeServices() async {
  PreferencesHelper.init();
  await Routes.init();
}