import 'package:bitirme_pjesi/cari.dart';
import 'package:bitirme_pjesi/modeller/MusteriModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class cari_cari_islemler extends StatefulWidget {
  const cari_cari_islemler({super.key, required this.cariKart});

  @override
  State<cari_cari_islemler> createState() => _cari_cari_islemlerState();
  final MusteriModel cariKart;
}

class _cari_cari_islemlerState extends State<cari_cari_islemler> {
  TextEditingController belgeNo = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
 
  
    List<Widget> tasarimList = [
      GestureDetector(
        onTap: () {
     
        },
        child: tasarim(icon: Icon(Icons.shopping_bag), title: "Satış Faturası"),
      ),
      
      GestureDetector(
        onTap: () {
        //  belgeNumarasiSor(context, "Alis_Fatura");
        },
        child: tasarim(
            icon: Icon(
              Icons.receipt_long,
            ),
            title: "Alış Fatura"),
      ),
      GestureDetector(
        onTap: () {
        
     
        },
        child: tasarim(icon: Icon(Icons.payment), title: "Tahsilat"),
      ),
      GestureDetector(
        onTap: () {
         
        },
        child: tasarim(icon: Icon(Icons.payment), title: "Ödeme"),
      ),
    ];

    return Scaffold(
        body: ListView.builder(
      itemCount: tasarimList.length,
      itemBuilder: (context, index) {
        return tasarimList[index];
      },
    ));
  }

}

class tasarim extends StatelessWidget {
  const tasarim({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    bool gosterilsinmi = true;
 
    return gosterilsinmi == true
        ? Column(
            children: [
              ListTile(
                  title: Text(title),
                  leading: icon,
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 10,
                  )),
              Divider(
                thickness: 1,
              )
            ],
          )
        : Container();
  }
}
