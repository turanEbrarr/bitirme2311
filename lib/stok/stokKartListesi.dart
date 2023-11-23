import 'dart:math';

import 'package:bitirme_pjesi/appBar/AppBar.dart';
import 'package:bitirme_pjesi/listeler/listeler.dart';
import 'package:bitirme_pjesi/modeller/stokModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Stok extends StatefulWidget {
  const Stok({
    Key? key,
  }) : super(key: key);

  @override
  State<Stok> createState() => _StokState();
}

class _StokState extends State<Stok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 60,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        } else {}
                      },
                      onSaved: (value) {},
                      // obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Aranacak kelime(İsim/Kod/Marka)",
                          filled: true,
                          fillColor: Colors.white60,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                             var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SimpleBarcodeScannerPage(),
                            ));
                        setState(() {
                          if (res is String) {
                           
                          }
                          
                        });
                    }, icon: Icon(Icons.camera_alt_rounded)),

                IconButton(
                    onPressed: () {}, icon: Icon(Icons.filter_list_outlined)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Listeler.stokList.length,
                itemBuilder: (BuildContext context, int index) {
                  StokModel StokKart = Listeler.stokList[index];

                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            children: [
                              Text(StokKart.ADI!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                              Spacer(),
                              IconButton(onPressed: () {
                                  showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20)
                          ),

                        ),
                        builder: (context)=>Container(child:
                        Column(

                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Divider(
                                color: Colors.black54,
                                height: 10,
                                thickness: 3,
                                indent: 150,
                                endIndent: 150,
                              ),
                            ),  
                            
                            ListTile(
                              leading: Icon(Icons.history,color: Colors.amber,),
                              title: Text('Geçmiş Satışlar',style: TextStyle(color: Colors.black,)),
                            ),
                            ListTile(
                                leading: Icon(Icons.search,color: Colors.green,),
                                title: Text('Stok Detay',style: TextStyle(color: Colors.black,),)
                            ),
                            ListTile(
                              leading: Icon(Icons.image,color: Colors.green,),
                              title: Text('Stok Resim',style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                        ));
                                
                              }, icon: Icon(Icons.more_vert)),
                            ],
                          ),
                        ),
                        ListTile(
                          subtitle: Text(StokKart.KOD!),
                          title: Text("Kodu"),
                          leading: Icon(
                            Icons.barcode_reader,
                            color: Colors.green,
                          ),
                        ),
                        ListTile(
                          subtitle: Text(StokKart.MARKA!),
                          title: Text("Marka"),
                          leading: Icon(
                            Icons.shopping_bag,
                            color: Colors.yellow,
                          ),
                        ),
                        ListTile(
                          subtitle: Text(StokKart.SATIS_KDV!.toStringAsFixed(2)),
                          title: Text("KDV"),
                          leading: Icon(
                            Icons.receipt_long,
                            color: Colors.red,
                          ),
                        ),
                        ListTile(
                          subtitle: Text(StokKart.SFIYAT1!.toStringAsFixed(2)),
                          title: Text("Satış Fiyatı"),
                          leading: Icon(
                            Icons.money,
                            color: Colors.blue,
                          ),
                        ),
                        ListTile(
                          subtitle: Text(StokKart.BAKIYE!.toStringAsFixed(2)),
                          title: Text("Bakiye"),
                          leading: Icon(
                            Icons.account_balance,
                            color: Colors.green,
                          ),
                        ),
                        
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
