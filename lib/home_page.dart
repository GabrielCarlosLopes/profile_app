import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfil_page/config.dart';
import 'package:perfil_page/widgets/header_title.dart';
import 'package:perfil_page/widgets/list_categories.dart';
import 'package:perfil_page/widgets/mentors_list.dart';
import 'package:perfil_page/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ThemeChanger? themeChanger;
  bool? systemIsDark;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      themeChanger?.setDarkStatus(systemIsDark!);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    systemIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    Size size = MediaQuery.of(context).size;

    final List<Widget> _widgetOptions = <Widget>[
      Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/icon_awesome_sun.svg',
                    color: themeChanger?.isDark() ? Colors.grey : Colors.orange,
                  ),
                  Switch(
                    activeColor: Colors.orange,
                    value: themeChanger?.isDark(),
                    onChanged: (status) {
                      themeChanger?.setDarkStatus(status);
                    },
                  ),
                  SvgPicture.asset(
                    'assets/icon_awesome_moon.svg',
                    color: themeChanger?.isDark() ? Colors.orange : Colors.grey,
                  ),
                ],
              ),
            ),
            SearchBar(size: size),
            ListCategories(size: size),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, top: 32.0, bottom: 32.0),
              child: Text(
                'Top mentors',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            MentorsList(size: size),
          ],
        ),
      ),
      Text(
        'Index 2: Likes',
        style: optionStyle,
      ),
      Text(
        'Index 3: Perfil',
        style: optionStyle,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.white,
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
