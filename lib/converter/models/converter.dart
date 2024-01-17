import 'dart:convert';
import 'dart:io';
import 'package:restic/converter/mixin/round.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'converter_data.dart';

class Converter {

  Future<ConverterData?> converterDataFromApi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final client = HttpClient();

    final url = Uri.parse('https://v6.exchangerate-api.com/v6/232c70d46c7a43c234f2ae51/latest/USD');
    final request = await client.getUrl(url);
    final response = await request.close();


    late dynamic jsonStringResult; 
    if (response.statusCode == 200){
      final jsons = await response.transform(utf8.decoder).toList().then((value) => value.join());
      jsonStringResult = jsonDecode(jsons);
      sharedPreferences.setString("jsonMap", json.encode(jsonStringResult));
    } else{
      final jsons = sharedPreferences.getString("jsonMap")!;
      jsonStringResult = jsonDecode(jsons);
    }

    late final ConverterData data;

    try {
      data = ConverterData.fromJson(jsonStringResult);
    } catch (_) {
      return null;
    }

    return data;
  }

  double? convert({required double value, required String startCode,required String endCode,required ConverterData converterData}) {
    final mapData = converterData.mapData;

    if (!mapData.containsKey(startCode) || !mapData.containsKey(endCode)) {return null;}

    final double startConvertValue = mapData[startCode]!;
    final double endConvertValue = mapData[endCode]!;
    
    final baseValue = value * ( 1 / startConvertValue);

    return (baseValue * endConvertValue).roundDouble(2);
  }
}
