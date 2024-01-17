import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restic/converter/manager/cubit.dart';
import 'package:restic/converter/ui/widgets.dart';

class PageMain extends StatelessWidget {
  const PageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitMain(),
      child: Scaffold(
        appBar: AppBar(title:  const Text('Currency converter')),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ConverterWidget(),
          ) 
        ),
      ),
    );
  }
}