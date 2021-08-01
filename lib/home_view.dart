import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:theme_dark_light/app_state.dart';
import 'package:theme_dark_light/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, homeViewModel, _) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Some ordinary text'),
              ElevatedButton(
                onPressed: () {
                  AppState appState = AppState();
                  appState.isDarkTheme = !appState.isDarkTheme;
                },
                child: Text('Change Theme'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
