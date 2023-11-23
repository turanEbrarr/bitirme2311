import 'package:bitirme_pjesi/appBar/AppBar.dart';
import 'package:bitirme_pjesi/cari.dart';
import 'package:bitirme_pjesi/cari/cariGenelBilgiler.dart';
import 'package:bitirme_pjesi/cari/cariGenelIslemler.dart';
import 'package:bitirme_pjesi/cari/cariRaporlar.dart';
import 'package:bitirme_pjesi/cari/cariletisimBilgileri.dart';
import 'package:bitirme_pjesi/modeller/MusteriModel.dart';
import 'package:flutter/material.dart';


class cari_kart_page extends StatefulWidget {
  const cari_kart_page({super.key, required this.cariKart});
  final MusteriModel cariKart;

  @override
  State<cari_kart_page> createState() => _cari_kart_pageState();
}

class _cari_kart_pageState extends State<cari_kart_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: MyAppBar(),
          body: Column(children: [
            TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: ("İşlemler"), icon: Icon(Icons.receipt_long)),
                  Tab(text: ("Genel"), icon: Icon(Icons.info)),
                  Tab(text: ("İletişim"), icon: Icon(Icons.wifi_calling_3)),
                  Tab(
                    text: ("Rapolar"),
                    icon: Icon(Icons.bar_chart_rounded),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                cari_cari_islemler(cariKart: widget.cariKart,),
                cari_cari_genel(cariKart: widget.cariKart,),
                cari_cari_iletisim(cariKart: widget.cariKart,),
                cari_cari_rapor(cariKart: widget.cariKart),
              ]),
            )
          ]),
        ));
  }
}
