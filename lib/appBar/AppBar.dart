import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
   MyAppBar({super.key});
    var output = "0".obs; // get paketi kullanarak değişken böyle tanımlanıyor . obs diyon yani başının ucuna otur diyon bundan sonra artık output = "25" demiyon mesela şöyle d,yon output.value = "25" farkettiysen bundan sonra outpt nerde değişiyosa oraya output.value yazdım
  var sayi1 = 0.0;
  var sayi2 = 0.0;
  var islem = "";
  var ilktik = true;
  buttonPressed(String buttonText) {
    if (ilktik) {
       output.value = "";
      ilktik = false;
    }
    

    if (buttonText == "TEMİZLE") {
      output.value = "0";
      sayi1 = 0.0;
      sayi2 = 0.0;
      islem = "";

    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      sayi1 = double.parse(output.value);
      islem = buttonText;
      output.value = sayi1.toString() + buttonText;
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("Zaten Ondalık");
        return;
      } else {
        output.value = output.value + buttonText;
      }
    } else if (buttonText == "=") {
      if (islem == "+") {
         output.value = (sayi1 + sayi2).toString();
      }
      if (islem == "-") {
         output.value = (sayi1 - sayi2).toString();
      }
      if (islem == "X") {
         output.value = (sayi1 * sayi2).toString();
      }
      if (islem == "/") {
         output.value = (sayi1 / sayi2).toString();
      }
      sayi1 = 0.0;
      sayi2 = 0.0;
    } else {
      sayi2 = double.parse(buttonText);
       output.value =  output.value + buttonText;
    }
    print(output);
  // bak sildim mesela setstateyi
   
      output = output;
         print("OUt"+ output.value);
   
  }

  buildButton(String buttonText) {
    return Expanded(
        child: OutlinedButton(
         // padding: EdgeInsets.all(24),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            {buttonPressed(buttonText);};
          },
        ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //  backgroundColor: Colors.black,
         // title: Text('Bildirim'),
         // content: Text('Bu bir alert dialog örneğidir.'),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                child: Obx(() => Text( // son olarak bu değişkeni kullandığın  yeri böyle obx widgeti ile sarman gerekiyo mesela ben texti sarmışım bak
        output.value,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
                children: [
            Row(
            children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/"),
          ],
        ),
        Row(
        children: [
        buildButton("4"),
        buildButton("5"),
        buildButton("6"),
        buildButton("X"),
        ],
        ),
        Row(
        children: [
        buildButton("1"),
        buildButton("2"),
        buildButton("3"),
        buildButton("-"),
        ],
        ),
        Row(
        children: [
        buildButton("."),
        buildButton("0"),
        buildButton("00"),
        buildButton("+"),
        ],
        ),
        Row(
        children: [
        buildButton("TEMİZLE"),
        buildButton("="),
        ],),
          ],
        )
          ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
            'DÜKKAN CEPTE',
          style: TextStyle(
            fontWeight: FontWeight.normal
          ),
        ),
          backgroundColor: Color(0xE3011221),
          actions: [
            IconButton(onPressed: (){
              _showAlertDialog(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>hesap_makinesi()));
             //Navigator.push(context, MaterialPageRoute(builder: (context)=>HesapMakinesi()));
            }, icon: Icon(Icons.calculate)),
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.currency_lira))
          ],
        );
  }
   @override
  Size get preferredSize => Size.fromHeight(50);
}