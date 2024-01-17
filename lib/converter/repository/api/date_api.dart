import 'package:restic/converter/models/converter_data.dart';
import 'dart:convert';
import 'dart:io';
import '../interface.dart';

class ApiRepository implements Repository{
  @override
  Future<ConverterData?> converterData() async{
    final client = HttpClient();

    final url = Uri.parse('https://v6.exchangerate-api.com/v6/232c70d46c7a43c234f2ae51/latest/USD');
    final request = await client.getUrl(url);
    final response = await request.close();

    late dynamic jsonStringResult; 
    final jsons = await response.transform(utf8.decoder).toList().then((value) => value.join());
    jsonStringResult = jsonDecode(jsons);

    late final ConverterData data;

    try {
      data = ConverterData.fromJson(jsonStringResult);
    } catch (_) {
      return null;
    }

    return data;
  }

}