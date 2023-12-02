import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/presentation/Screen/detail_screen.dart';
import 'package:skill_test_project/presentation/Screen/form_screen.dart';
import 'package:skill_test_project/presentation/Screen/home_screen.dart';

import '../../business/bottom_navBloc/bottom_navigator_bloc.dart';

class landingPage extends StatelessWidget {
  landingPage({super.key});
  final List<Widget> bottomNavigatorScreen = [
    const homeScreen(),
    const detailScreen(),
    const FormScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorBloc, BottomNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          body: bottomNavigatorScreen.elementAt(state.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              currentIndex: state.currentIndex,
              onTap: (index) {
                BlocProvider.of<BottomNavigatorBloc>(context)
                    .add(OnTapChange(TabIndex: index));
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'Detail'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.format_align_center), label: 'Form'),
              ]),
        );
      },
    );
  }
}
