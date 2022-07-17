import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPref;

  static Future<SharedPreferences> initSharedPref() async {
    sharedPref = await SharedPreferences.getInstance();
    return sharedPref!;
  }

  static Future<bool?> addData({String? key, String? value}) async {
    return await sharedPref!.setString(key!, value!).catchError(
      (e) {
        print(e.toString());
        throw (e.toString());
      },
    );
  }

  static String? getData({String? key}) {
    return sharedPref!.getString(key!);
  }
}
