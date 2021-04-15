/// Based on Material Flutter code sample for BottomNavigationBar
// MAIN CAPP APP: houses bottom navigation bar and color theme
import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'menu_tab.dart';
import 'orders_tab.dart';
import 'account_tab.dart';

class CappApp extends StatelessWidget {
  const CappApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capp Bar App',
      home: CappAppHomePage(),
      theme: _buildCappBarTheme(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class CappAppHomePage extends StatefulWidget {
  const CappAppHomePage({Key? key}) : super(key: key);

  @override
  _CappAppHomePageState createState() => _CappAppHomePageState();
}

/// This is the private State class that goes with CappAppHomePage.
class _CappAppHomePageState extends State<CappAppHomePage> {
  int _selectedIndex = 0;
  
  // Tabs in Bottom Navigation Bar
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Menu(),
    Orders(),
    Account(),
  ];

  // Respond to item/tab button press
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 4 Tabs Bottom Navigation Bar: Home, Menu, Orders, Account
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      /*appBar: AppBar(
        //title: const Text('BottomNavigationBar Sample'),
      ),*/
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ), 
      // Bottom Navigation Bar Build
      bottomNavigationBar: BottomNavigationBar(        
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,      
        // Theme Color and Text
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,

        // Tab display in Bottom Nav Bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe_outlined),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// THEME DATA
ThemeData _buildCappBarTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _cappBarColorScheme,
    textTheme: _buildCappBarTextTheme(base.textTheme),
  );
}

TextTheme _buildCappBarTextTheme(TextTheme base){
  return base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Montserrat',
        displayColor: coffeeBrown,
        bodyColor: coffeeBrown,
      );
}

const ColorScheme _cappBarColorScheme = ColorScheme(
  primary: sageGreen,
  primaryVariant: sageGreen2,
  secondary: coffeeYellow,
  secondaryVariant: coffeeBrown,
  surface: coffeeYellow, // BottomNavBar Color
  background: backgroundWhite,
  error: errorRed,
  onPrimary: coffeeBrown,
  onSecondary: coffeeBrown,
  onSurface: coffeeBrown,
  onBackground: coffeeBrown,
  onError: surfaceWhite,
  brightness: Brightness.light,
);

//Color(#AARRGGBB)
const Color sageGreen = Color(0xFF82947E);
const Color sageGreen2 = Color(0xFF384036);

const Color coffeeYellow = Color(0xFFF5E2B5);
const Color coffeeBrown = Color(0xFF231709);

const Color surfaceWhite = Color(0xFFF5F3EB);
const Color backgroundWhite = Colors.white;

const Color errorRed = Color(0xFFC5032B);

const defaultLetterSpacing = 0.03;
