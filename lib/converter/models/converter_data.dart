class ConverterData {
const ConverterData({required this.baseCode, required this.mapData, required this.nameCode});
  final String baseCode;
  final List<String> nameCode;
  final Map<String, double> mapData;

  factory ConverterData.fromJson(dynamic json){
    assert(json is Map<String, dynamic>);

    final map =  json as Map<String, dynamic>;

    final baseCode = map['base_code'] as String;
    final mapData = map['conversion_rates'] as Map<String, dynamic>;

    List<String> list = [];
    for (var element in mapData.keys) {list.add(element);}

    final mapDataDouble =  <String, double>{};
    for (var element in mapData.keys) {
      final value = mapData[element];
      if (value is num){mapDataDouble[element] = value.toDouble();}
    }

    return ConverterData(baseCode: baseCode, mapData: mapDataDouble, nameCode: list);
  }
}
