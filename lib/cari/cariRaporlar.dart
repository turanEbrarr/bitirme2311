import 'package:bitirme_pjesi/modeller/MusteriModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class cari_cari_rapor extends StatefulWidget {
  final MusteriModel cariKart;
  const cari_cari_rapor({super.key, required this.cariKart});

  @override
  State<cari_cari_rapor> createState() => _cari_cari_raporState();
}

class _cari_cari_raporState extends State<cari_cari_rapor> {
 


  @override
  Widget build(BuildContext context) {
    final List rapor = [
      "Cari Hesap Ektresi",
    
      //"Stoklu Cari Hesap Ekstresi",
     
      //"Bekleyen Siparişler",
      "Faturalar",
     
      //"Yapılacak Tahsilatlar",
      //  "Yapılacak Ödemeler",
      
      // "En Çok Tercih Edilen Ürünler(Satış)",
      //"En Çok Tercih Edilen Ürünler(Alış)"
    ];

    return Center(
        child: ListView.builder(
            itemCount: rapor.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                        child: ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.receipt_long,
                              color: Colors.black,
                            )
                          ),
                          title: Text(
                            ' ${rapor[index]}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                           
                          },
                        ),
                      )),
                  Divider(
                    thickness: 2,
                  )
                ],
              );
            })));
  }
}
