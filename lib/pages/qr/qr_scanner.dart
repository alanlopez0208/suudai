import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:suudai/pages/qr/result_screen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget{
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();

}

class _QRScannerState extends State<QRScanner>{
  bool isScanCompleted = false;
  void closeScreen(){
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Deteccion QR",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              letterSpacing: 1
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Column(
                  children: const [
                    Text("Escane el codigo QR",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: (barcode,args){
                  if(!isScanCompleted){
                    String code = barcode.rawValue ?? '---';
                    print("1234567890-1234567890"+code);
                    if(code=="bird"||code=="alacran"||code=="lobo") {
                      isScanCompleted = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ResultScreen(
                                closeScreen: closeScreen, code: code,))
                      );
                    }
                  }
                },
              ),
              flex: 4,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("Escane el codigo QR",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}