import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:suudai/pages/qr/qr_scanner.dart';

class ResultScreen extends StatelessWidget{
  final List<String> nmSc= const ["Xenospiza Baileyi","Canis Lupus Baileyi","Centruroides sculpturatus"];
  final List<String> nmFm= const ["Passerellidae","Canidae","Scorpionidae"];
  final List<String> nmFood= const ["Granivoro","Carnívoro","Carnívoro"];
  final List<String> nmHunter= const ["Aves de presa","Otros Depredadores","Aves"];
  final String code;
  final Function() closeScreen;

  int getCurrentTarget(String target){
    //0 gorrion serrano
    //1 lobo mexicano
    //2 alacran
    int res=0;
    if(target=="bird")res=0;
    else if(target=="lobo")res=1;
    else if(target=="alacran")res=2;
    return res;
  }

  Image getProPic(){
    var res;
    if(code=="bird"){
      res = Image(image: AssetImage("images/bird1.png"));
    }else if(code=="lobo"){
      res = Image(image: AssetImage("images/lobo1.jpg"));
    }else if(code=="alacran"){
      res = Image(image: AssetImage("images/alacran1.png"),);
    }
    return res;
  }

  Widget getProDes(){
    var res, target;
    if(code=="bird"){
      target = "El gorrión serrano, conocido científicamente como Zonotrichia leucophrys, es una especie de ave paseriforme que pertenece a la familia de los Emberizidae. Este pequeño pájaro es ampliamente distribuido en América del Norte y se caracteriza por su plumaje distintivo y su comportamiento social.\nEl gorrión serrano es reconocido por su tamaño compacto y su cuerpo rechoncho que mide alrededor de 15 centímetros de longitud. El macho y la hembra presentan diferencias en su apariencia. El macho cuenta con una cabeza grisácea con una corona de plumas negras y una mancha negra en el pecho, que contrasta con su vientre blanco. Sus alas son de color marrón oscuro y presentan rayas blancas que son más evidentes durante el vuelo. Por otro lado, la hembra tiene un patrón similar pero menos llamativo, con tonos más apagados y menos contraste en su plumaje.\nEstas aves son nativas de las regiones montañosas y subalpinas de América del Norte, desde Alaska hasta el noroeste de México. Se encuentran en hábitats abiertos como praderas, áreas arbustivas, bordes de bosques y áreas cercanas a cuerpos de agua. Durante los meses de verano, migran hacia latitudes más altas en busca de áreas de reproducción adecuadas.\nEl gorrión serrano es un ave gregaria y forma grupos grandes conocidos como 'bandadas' durante la temporada no reproductiva. Estas bandadas pueden contener decenas o incluso cientos de individuos. Durante el invierno, a menudo se unen a bandadas mixtas con otras especies de pájaros, lo que les brinda protección contra los depredadores y una mayor eficiencia en la búsqueda de alimento.\nEn cuanto a su comportamiento alimentario, el gorrión serrano es principalmente granívoro, lo que significa que se alimenta principalmente de semillas y granos. Su dieta incluye semillas de pasto, hierbas, arbustos y malezas, así como también pequeños insectos y bayas. Utilizan su pico fuerte y cónico para abrir semillas y romper las cáscaras. Durante la temporada de cría, también incluyen una mayor cantidad de insectos en la dieta de los polluelos para proporcionarles una mayor cantidad de proteínas.\nLa reproducción del gorrión serrano generalmente tiene lugar durante la primavera y el verano. Los machos establecen territorios y exhiben un comportamiento de cortejo para atraer a las hembras. El canto del macho es un trino distintivo y melódico que utiliza para defender su territorio y atraer a la pareja. Construyen nidos en el suelo o en arbustos bajos utilizando pasto, raíces y otros materiales vegetales. La hembra pone de tres a cinco huevos de color azul verdoso con manchas oscuras y los incuba durante aproximadamente dos semanas. Ambos padres participan en la alimentación de los polluelos hasta que están listos para abandonar el nido, aproximadamente a los 9-10 días de edad.";
    }else if(code=="lobo"){
      target = "El lobo mexicano, también conocido como Canis lupus baileyi, es una subespecie de lobo gris nativa de México y considerada una de las especies más emblemáticas y en peligro de extinción en América del Norte. A continuación, se presenta una descripción de esta fascinante especie en una o dos cuartillas:\nEl lobo mexicano es un carnívoro de tamaño mediano a grande que presenta características distintivas en su apariencia. Los adultos suelen medir alrededor de 1.5 metros de longitud, desde la punta de la nariz hasta la base de la cola, y su altura en el hombro puede alcanzar los 76 centímetros. Los machos son generalmente más grandes que las hembras. Su peso varía entre los 27 y los 45 kilogramos, siendo los machos más pesados que las hembras.\nEste lobo se caracteriza por su pelaje espeso y denso, que le permite adaptarse a los climas extremos en los que habita. El color de su pelaje varía desde el gris claro hasta el gris oscuro, con tonos de marrón y negro presentes en algunas zonas. También poseen una capa de pelaje más larga y gruesa durante los meses de invierno para protegerse del frío.\nEl hábitat natural del lobo mexicano se encontraba originalmente en las zonas montañosas y boscosas de México y el suroeste de Estados Unidos. Sin embargo, debido a la caza excesiva y la pérdida de hábitat, su rango de distribución se ha reducido drásticamente. En la actualidad, se encuentran principalmente en áreas protegidas y programas de reintroducción en México y Estados Unidos.\nEste lobo es un animal social que vive en manadas, que generalmente están compuestas por una pareja reproductora y su descendencia. Las manadas suelen estar formadas por alrededor de cinco a ocho individuos, aunque puede variar. Tienen una estructura social jerárquica en la que los machos y las hembras alfa son los líderes de la manada y se encargan de la reproducción y la toma de decisiones importantes.\nLa dieta del lobo mexicano se basa principalmente en carne. Su alimentación incluye una variedad de presas, como ciervos, alces, conejos y roedores. También pueden consumir carroña cuando es necesario. Son cazadores altamente eficientes y trabajan en equipo para emboscar a sus presas, utilizando tácticas de caza coordinadas.\nLa reproducción del lobo mexicano ocurre generalmente una vez al año, durante el invierno. Las parejas alfa son las únicas que se reproducen dentro de la manada. La hembra gesta a los cachorros durante aproximadamente 63 días y luego da a luz a una camada de dos a cinco crías. Los cachorros nacen ciegos y dependen completamente de sus padres durante los primeros meses. A medida que crecen, comienzan a participar en juegos y aprenden habilidades de caza de los adultos.\nLamentablemente, el lobo mexicano se encuentra en peligro crítico de extinción. La caza indiscriminada, la pérdida de hábitat y los conflictos con los seres humanos han sido las principales causas";
    }else if(code=="alacran"){
      target = "Los alacranes son arácnidos pertenecientes al orden Scorpiones. Tienen un cuerpo segmentado dividido en dos partes principales: el cefalotórax, que alberga los órganos sensoriales y las pinzas delanteras, y el abdomen, que contiene el aguijón venenoso y el telson. Su tamaño varía según la especie, pero generalmente miden entre 2 y 8 centímetros de largo. Su cuerpo está cubierto por una exoesqueleto resistente y quitinoso de color marrón oscuro o negro.\nPoseen ocho patas largas y delgadas que les permiten moverse ágilmente. En la parte delantera, tienen un par de pinzas modificadas que utilizan para capturar presas y defenderse de posibles amenazas. En la parte posterior del abdomen, se encuentra el aguijón curvado, que es su principal arma defensiva. Los alacranes inyectan veneno a través de su aguijón para paralizar a sus presas o defenderse de depredadores.\nEl alacrán tiene un par de pedipalpos, estructuras similares a pequeñas pinzas, que utilizan para manipular y llevar el alimento a la boca. También poseen dos pares de ojos en la parte frontal del cefalotórax, que les permiten detectar movimiento y cambios en la luz.";
    }


    res = Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(3.00)),
            Text(
              target,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );

    return res;
  }

  String getProName(String target){
    var res;
    if(target=="bird") res= "Gorrión Serrano";
    else if(target=="lobo") res= "Lobo Mexicano";
    else if(target=="alacran") res= "Escorpion";

    return res;
  }

  const ResultScreen({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF6AA83D),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              closeScreen();
              Navigator.pop(context);
            }
        ),
        centerTitle: true,
        title: Text("Suudai’ App"),
      ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: getProPic(),


                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getProName(code),
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Color(0xFF6AA83D),
                        ),
                      ),

                      QrImageView(
                        data: code,
                        size: 50,
                        version: QrVersions.auto,
                      ),
                    ],
                  ),color: Color(0xFF6AA83D),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Color(0xFF6AA83D).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Nombre Cientifico"),
                      subtitle: Text(
                        nmSc[getCurrentTarget(code)],
                        style: TextStyle(fontSize: 30),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Familia"),
                      subtitle: Text(
                        nmFm[getCurrentTarget(code)],
                        style: TextStyle(fontSize: 30),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Dieta"),
                      subtitle: Text(
                        nmFood[getCurrentTarget(code)],
                        style: TextStyle(fontSize: 30),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Depredadores"),
                      subtitle: Text(
                        nmHunter[getCurrentTarget(code)],
                        style: TextStyle(fontSize: 30),
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 15,width: double.infinity),
                Text("Descripción", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),

                getProDes(),
              ],
            ),
          )
        )
    );
  }

}