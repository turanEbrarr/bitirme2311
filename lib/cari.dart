import 'dart:math';

import 'package:bitirme_pjesi/appBar/AppBar.dart';
import 'package:bitirme_pjesi/cari/cariGenel.dart';
import 'package:bitirme_pjesi/cari/cariGenelBilgiler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listeler/listeler.dart';
import 'modeller/MusteriModel.dart';

class Cari extends StatefulWidget {
  const Cari({
    Key? key,
  }) : super(key: key);

  @override
  State<Cari> createState() => _CariState();
}

class _CariState extends State<Cari> {
  Color randomColor() {
    Random random = Random();
    int red = random.nextInt(128); // 0-127 arasında rastgele bir değer
    int green = random.nextInt(128);
    int blue = random.nextInt(128);
    return Color.fromARGB(255, red, green, blue);
  }

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
                    width: MediaQuery.of(context).size.width * 0.85,
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
                    onPressed: () {}, icon: Icon(Icons.filter_list_outlined))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Listeler.musteriList.length,
                itemBuilder: (BuildContext context, int index) {
                  MusteriModel cariKart = Listeler.musteriList[index];

                  String trim = cariKart.ADI!.trim();
                  String harf1 = "";
                  String harf2 = "";
                  if (trim.length > 0) {
                    harf1 = trim[0];
                    if (trim.length == 1) {
                      harf2 = "K";
                    } else {
                      harf2 = trim[1];
                    }
                  } else {
                    harf1 = "A";
                    harf2 = "B";
                  }
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>cari_kart_page(cariKart: cariKart,)));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: CircleAvatar(
                                  child: Text(harf1 + harf2!),
                                  backgroundColor: randomColor(),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(cariKart.ADI!),
                                  subtitle: Text(cariKart.IL!),
                                  trailing: Text(cariKart.BAKIYE!.toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 8.0,
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
