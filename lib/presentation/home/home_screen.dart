import 'package:flutter/material.dart';
import 'package:test_valbury/util/mock/mock.dart';
import 'package:test_valbury/util/mock/rs_tab_item.dart';
import 'package:test_valbury/widget/rs_landing_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Mock mock = Mock();
    return MaterialApp(home: HomePage(mock: mock));
  }
}

class HomePage extends StatelessWidget {
  final Mock mock;

  HomePage({super.key, required this.mock});

  final List<String> banners = [
    'Banner 1',
    'Banner 2',
    'Banner 3',
    'Banner 4',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.blue,
          child: const Column(children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.favorite),
                Text("Valbury"),
                Spacer(),
                Icon(Icons.favorite)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Label 1',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Label 2',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              RSLandingWidget(title: "Rumah Sakit", tabs: mock.rsTabs),
              SizedBox(
                height: 100, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 200.0,
                        child: Center(
                          child: Text(
                            banners[index],
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              RSLandingWidget(title: "Klinik", tabs: mock.clinicTabs),
            ],
          )),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'RS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Klinik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Change the selected item color
        unselectedItemColor: Colors.grey, // Change the unselected item color
      ),
    );
  }
}
