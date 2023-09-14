import 'package:flutter/material.dart';
import 'package:test_valbury/util/mock/rs_mock.dart';
import 'package:test_valbury/util/mock/rs_tab_item.dart';

class Mock {
  List<RSMock> rs = [];
  List<RSTabItem> clinicTabs = [];
  List<RSTabItem> rsTabs = [];

  Mock() {
    List<RSTabItem> baseTabs = [
      RSTabItem(label: "Semua", rsType: null),
      RSTabItem(label: "BPJS", rsType: RSType.bpjs),
      RSTabItem(label: "Partner", rsType: RSType.partner)
    ];

    rs = [
      RSMock(
          icon: Icons.addchart_sharp,
          name: "RS Permata",
          address: "Depok",
          rsType: RSType.bpjs),
      RSMock(
          icon: Icons.youtube_searched_for,
          name: "RS Keluarga 1",
          address: "Jakarta ",
          rsType: RSType.near),
      RSMock(
          icon: Icons.baby_changing_station,
          name: "RS Keluarga 2",
          address: "Depok",
          rsType: RSType.bpjs),
      RSMock(
          icon: Icons.access_alarm,
          name: "RS Keluarga 3",
          address: "Jawa Barat",
          rsType: RSType.partner),
      RSMock(
          icon: Icons.cabin,
          name: "RS Keluarga 4",
          address: "Bogor",
          rsType: RSType.near),
      RSMock(
          icon: Icons.e_mobiledata,
          name: "RS Keluarga 5",
          address: "Bekasi",
          rsType: RSType.partner),
      RSMock(
          icon: Icons.face,
          name: "RS Keluarga 6",
          address: "Kalimantan",
          rsType: RSType.partner),
      RSMock(
          icon: Icons.gamepad,
          name: "RS Keluarga 7",
          address: "Cirebon",
          rsType: RSType.bpjs),
      RSMock(
          icon: Icons.handshake,
          name: "RS Keluarga 8",
          address: "Sumatera",
          rsType: RSType.bpjs),
    ];

    clinicTabs = List.from(baseTabs);
    rsTabs = [...baseTabs, RSTabItem(label: "Terdekat", rsType: RSType.near)];
  }
}
