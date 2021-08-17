import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pushnoti/screens/tabs/home_screens.dart';
import 'package:pushnoti/screens/tabs/setting_screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    SettingScreen(),
  ];
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  static final String oneSignalAppId = '04a7cc20-1543-45ac-865c-ac8f7304cd5c';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
  }
}
