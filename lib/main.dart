import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:theme_dark_light/home_view.dart';
import 'package:theme_dark_light/app_state.dart';
import 'package:theme_dark_light/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppState>.reactive(
      viewModelBuilder: () => AppState(),
      onModelReady: (m) async => await m.init(),
      builder: (context, appState, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: appState.isDarkTheme
            ? ThemeManager().darkTheme
            : ThemeManager().lightTheme,
        home: HomeView(),
      ),
    );
  }
}
