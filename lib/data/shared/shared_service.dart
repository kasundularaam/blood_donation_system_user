import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static const String nicKey = "nic";
  static const String uidKey = "uid";
  static const String typeKey = "type";

  static Future<String> getNic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String nic = preferences.getString(nicKey) ?? "";
    return nic;
  }

  static Future<String> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String uid = preferences.getString(uidKey) ?? "";
    return uid;
  }

  static Future<String> getType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String type = preferences.getString(typeKey) ?? "";
    return type;
  }

  static Future addUser({required String nic, required String uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(nicKey, nic);
    preferences.setString(uidKey, uid);
    preferences.setString(typeKey, "user");
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(nicKey);
    preferences.remove(uidKey);
    preferences.remove(typeKey);
  }

  static Future addBloodBank({required String uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(uidKey, uid);
    preferences.setString(typeKey, "bloodBank");
  }

  static Future addLab({required String uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(uidKey, uid);
    preferences.setString(typeKey, "lab");
  }

  static Future removeBankAndLab() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(uidKey);
    preferences.remove(typeKey);
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String uid = preferences.getString(uidKey) ?? "";
    return uid.isNotEmpty;
  }
}
