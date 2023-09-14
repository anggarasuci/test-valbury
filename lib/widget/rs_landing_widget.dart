import 'package:flutter/material.dart';
import 'package:test_valbury/util/mock/mock.dart';
import 'package:test_valbury/util/mock/rs_mock.dart';
import 'package:test_valbury/util/mock/rs_tab_item.dart';

class RSLandingWidget extends StatefulWidget {
  final String title;
  final List<RSTabItem> tabs;

  const RSLandingWidget({super.key, required this.title, required this.tabs});

  @override
  State<RSLandingWidget> createState() => _RSLandingWidgetState();
}

class _RSLandingWidgetState extends State<RSLandingWidget> {
  late Mock mock;
  List<RSMock> rsItems = [];
  List<RSMock> displayRS = [];
  RSType? selectedRSType;

  @override
  void initState() {
    super.initState();
    mock = Mock();
    rsItems = mock.rs;
    displayRS = rsItems.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.title),
              const Spacer(),
              const Text("Lihat Semua",
                  style: TextStyle(
                    color: Colors.blue,
                  ))
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.tabs.length,
              itemBuilder: (context, index) {
                final tab = widget.tabs[index];
                bool isSelected = selectedRSType == tab.rsType;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedRSType = tab.rsType;
                      displayRS = selectedRSType == null
                          ? rsItems.take(3).toList()
                          : rsItems
                              .where((item) => item.rsType == selectedRSType)
                              .take(3)
                              .toList();
                    });
                  },
                  child: Card(
                    color: isSelected ? Colors.blue : null,
                    margin: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 150,
                      child: Center(
                        child: Text(
                          widget.tabs[index].label,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: displayRS.length,
                  itemBuilder: (context, index) {
                    final item = displayRS[index];
                    return Row(
                      children: [
                        Icon(item.icon),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(item.name), Text(item.address)],
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Lihat Detail",
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
