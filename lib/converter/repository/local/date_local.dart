import 'dart:convert';
import 'package:restic/converter/models/converter_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../interface.dart';

class LocalRepository implements Repository{
  @override
  Future<ConverterData?> converterData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsons = sharedPreferences.getString("jsonMap")!;
    dynamic jsonStringResult = jsonDecode(jsons);

    late final ConverterData data;
    try {
      data = ConverterData.fromJson(jsonStringResult);
    } catch (_) {
      return null;
    }

    return data;
  }

    Future<void> loadToLocalData(dynamic jsonStringResult) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("jsonMap", json.encode(jsonStringResult));
  }

}