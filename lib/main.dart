import 'package:flutter/material.dart';

import 'constantes.dart';
import 'pages/aportacionCalc.dart';
import 'pages/configPage.dart';
import 'pages/info.dart';
import 'pages/metaCalc.dart';
import 'pages/valorPresenteCalc.dart';


//const Color kColorBackGround = kAzul;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VP_Calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int _currentView = 0;

final formKey = GlobalKey<FormState>();
final List<Widget> bodyListCalculator = [
  ValorPresenteCalc(),
  AportacionCalc(),
  MetaCalc()
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //extendBody: true,
      //backgroundColor: Color(0xFFe0e5ec),
      backgroundColor: kColorBackGround,
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.info, color: kAzul),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InfoPage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: kAzul,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfigPage()));
              //aqui va la nueva pagina de configuración
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 12.0),
              Container(
                height: 100.0,
                child: Image.asset(
                  'assets/logo_small.png',
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white30,
                ),
              ),
              SizedBox(height: 12.0),
              IndexedStack(
                index: _currentView,
                children: bodyListCalculator,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentView,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedItemColor: kAzul,
      unselectedItemColor: kGrisOscuro,
      onTap: (newView) {
        setState(() => _currentView = newView);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'Valor Presente',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.next_plan_outlined),
          label: 'Aportes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: 'Metas',
        ),
      ],
    );
  }
}
