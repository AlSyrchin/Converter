import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/converter/theme/theme.dart';
import '../manager/cubit.dart';
import '../manager/state.dart';

 class ConverterWidget extends StatelessWidget {
   const ConverterWidget({super.key});
 
   @override
   Widget build(BuildContext context) {
     return const Column(
        children: [
          WidgetLine(true),
          ButtonSwap(),
          WidgetLine(false),
        ],
      );
   }
 }

class ButtonSwap extends StatelessWidget {
  const ButtonSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<CubitMain>().swapCurrent(),
        icon: const Icon(Icons.swap_vert_sharp));
  }
}

class WidgetLine extends StatelessWidget {
  const WidgetLine(this.isWho,{super.key});
  final bool isWho;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isWho ? 'You send' : 'They get', textAlign: TextAlign.right),
        Row(
          children: [
            Expanded(child: isWho ? const TextInputWidget(): const TextOutWidget()),
            const SizedBox(width: 20),
            DropBtn(isWho),
          ],
        ),
      ],
    );
  }
}


class TextInputWidget extends StatelessWidget {
  const TextInputWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitMain, StateMain>(builder:(context, state) => TextField(
        style: inputText,
        keyboardType: TextInputType.number,
        readOnly: context.read<CubitMain>().isNotCurrent(),
        onChanged: (value) => context.read<CubitMain>().saveValueIn(value),
      ));
  }
}

class TextOutWidget extends StatelessWidget {
  const TextOutWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitMain, StateMain>(builder:(context, state) => TextField(
        style: inputText,
        readOnly: true,
        controller: TextEditingController(text: state.answer.toString()),
      ));
  }
}

class DropBtn extends StatelessWidget {
  const DropBtn(this.isWho, {super.key});
  final bool isWho;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitMain, StateMain>(builder: (context, state) => DropdownButton<String>(
      underline: const SizedBox(),
      value: isWho ? state.curentStart : state.curetnEnd,
      items: state.listName.map<DropdownMenuItem<String>>((String e) => DropdownMenuItem( value: e, child: Text(e))).toList(), 
      onChanged: (value) => context.read<CubitMain>().setCurent(value!, isWho),
      ),
    );
  }
}