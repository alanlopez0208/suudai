import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:suudai/modelos/animal.dart';
import 'package:suudai/screens/machine_learning/overlay.dart';
import 'package:suudai/screens/sections/presentation/lugar_info.dart';
import 'package:suudai/size_config.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;

  @override
  void initState() {
    super.initState();
    isScanCompleted = false;
  }

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: (barcode, args) {
                  debugPrint("checha esto-------------->$isScanCompleted");

                  if (!isScanCompleted) {
                    String code = barcode.rawValue ?? '---';

                    if (code == "bird" || code == "alacran" || code == "lobo") {
                      isScanCompleted = true;
                      List<Animal>? region = grupoAnimal[code];

                      String regionPath = "assets/images/g/g1.jpg";

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LugarInfo(
                            animales: region!,
                            imgRegion: regionPath,
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            Positioned(
              top: SizeConfig.screenhegit! / 4,
              child: OverlayCamera(
                ancho: SizeConfig.screenwidth! -
                    (SizeConfig.blockSizeHorizontal! * 10) * 2,
                largo: SizeConfig.screenhegit! / 2,
                padding: SizeConfig.blockSizeHorizontal! * 10,
              ),
            ),
            Positioned(
              top: SizeConfig.screenhegit! / 9,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Posiciona el codigo en el Cuadro",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    closeScreen();
  }
}
