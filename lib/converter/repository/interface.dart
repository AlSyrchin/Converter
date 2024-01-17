import '../models/converter_data.dart';

abstract class Repository{
  Future<ConverterData?> converterData();
}