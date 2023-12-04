import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('Hi2'),
      ),
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if(state is ConnectedState){
            return BuildTextWidget(state.message);
          }
          else if (state is NotConnectedState){
            return BuildTextWidget(state.message);
          }
          return SizedBox(); // initial state
        },
      ),
    );
  }
}

Widget BuildTextWidget(String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          message,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    ),
  );
}
