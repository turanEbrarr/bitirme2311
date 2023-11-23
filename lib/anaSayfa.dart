
import 'package:bitirme_pjesi/appBar/AppBar.dart';
import 'package:bitirme_pjesi/main.dart';
import 'package:bitirme_pjesi/yanmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
class Item {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  Item({required this.icon, required this.title, required this.backgroundColor});
}

List<Item> items = [
  Item(icon: Icons.groups, title: 'Cari Kart Listesi',backgroundColor: Color.fromARGB(
      227, 13, 73, 84), ),
  Item(icon: Icons.shopping_bag, title: 'Satış Fatura Kayıt',backgroundColor: Colors.orange),
  Item(icon: Icons.receipt_long, title: 'Alış İrsaliye',backgroundColor: Colors.orange),
  Item(icon: Icons.app_registration, title: 'Stok Kart Listesi',backgroundColor: Colors.green),
  Item(icon: Icons.local_shipping, title: 'Depo Transfer',backgroundColor: Colors.green),
  Item(icon: Icons.content_paste_search, title: 'Sayım Kayıt Fişi',backgroundColor: Colors.green),
  Item(icon: Icons.add_card, title: 'Tahsilat',backgroundColor: Colors.indigoAccent),
  Item(icon: Icons.account_balance_wallet, title: 'Ödeme',backgroundColor: Colors.indigoAccent),
  Item(icon: Icons.badge, title: 'Cari Raporları',backgroundColor: Colors.blueGrey),
  Item(icon: Icons.query_stats, title: 'Stok Raporları',backgroundColor: Colors.blueGrey),
  Item(icon: Icons.bar_chart, title: 'Fatura Raporları',backgroundColor: Colors.blueGrey)

  // Diğer öğeleri burada ekleyin
];



class anaSayfa extends StatefulWidget {
  const anaSayfa({Key? key}) : super(key: key);

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {


  bool showCloseIcons = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),

      drawer: YanMenu(),
      body: AnimationLimiter(
        child: Container(

          child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütunlu bir grid
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
          final item = items[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,

            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50,
              child: ScaleAnimation(
                delay: Duration(milliseconds: 275),
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      showCloseIcons = true;
                    });
                  },
                  child: Card(
                    color: item.backgroundColor,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       
                        children: <Widget>[
                          if (showCloseIcons)
                             Container(
                               alignment: Alignment.topRight,
                               child: IconButton(
                                  icon: Icon(Icons.close, color: Colors.black),
                                  onPressed: () {
                                    setState(() {
                                      items.remove(item);
                                      //items.clear();//Hepsini siler
                                      showCloseIcons = false;
                                    });
                                  },
                                ),
                             ),
                          Column(
                                children: [
                                  Icon(item.icon, size: 64.0, color: Colors.white,),
                                  SizedBox(height: 8.0),
                                  Text(
                                    item.title,
                                    style: TextStyle(fontSize: 18.0,color: Colors.white),
                                  ),
                                ],
                              ),

                        ],
                      ),


                  ),



        ),
              ),
            ),
          );
    },
    ),
        ),
      ),
    );
  }
}

