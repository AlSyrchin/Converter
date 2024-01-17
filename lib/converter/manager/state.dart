class StateMain {
    final double answer;
    final List<String> listName;
    final String textIn;
    final String ?curentStart;
    final String ?curetnEnd;
  StateMain({
    this.answer = 0,
    this.listName = const [],
    this.textIn = '',
    this.curentStart,
    this.curetnEnd,
  });


  StateMain copyWith({
    double? answer,
    List<String>? listName,
    String? textIn,
    String? curentStart,
    String? curetnEnd,
  }) {
    return StateMain(
      answer: answer ?? this.answer,
      listName: listName ?? this.listName,
      textIn: textIn ?? this.textIn,
      curentStart: curentStart ?? this.curentStart,
      curetnEnd: curetnEnd ?? this.curetnEnd,
    );
  }
}
