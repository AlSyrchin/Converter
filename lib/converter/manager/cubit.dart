import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/converter_data.dart';
import 'state.dart';
import '../models/converter.dart';

class CubitMain extends Cubit<StateMain> {
  final converter = Converter();
  late ConverterData? convertData; 
  CubitMain() : super(StateMain()){startconvert();}

  Future<ConverterData?> startconvert() async {
    convertData = await converter.converterDataFromApi();

    if (convertData == null) {
      emit(state.copyWith(answer: -1));
      return null;
    } else {
      emit(state.copyWith(listName: convertData!.nameCode));
      return convertData;
    }
  }

  bool isNotCurrent(){
    return (state.curentStart == null || state.curetnEnd == null);
  }

  void swapCurrent(){
    emit(state.copyWith(curentStart: state.curetnEnd, curetnEnd: state.curentStart));
    convert(state.textIn);
  }

  void saveValueIn(String value){
    emit(state.copyWith(textIn: value));
    convert(value);
  }

  void convert(String value){
    if (value == '') {emit(state.copyWith(answer: 0)); return;}
        final result = converter.convert(
        value: double.parse(value),
        startCode: state.curentStart!,
        endCode: state.curetnEnd!,
        converterData: convertData!);


    if (result == null) {
      emit(state.copyWith(answer: -2));
    } else {
      emit(state.copyWith(answer: result));
    }
  }

  void setCurent(String value, bool isWho){
    isWho ? emit(state.copyWith(curentStart: value)) : emit(state.copyWith(curetnEnd: value));
  }
}