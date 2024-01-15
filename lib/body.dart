import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyFoguinho extends StatefulWidget {
  const BodyFoguinho({super.key});

  @override
  State<BodyFoguinho> createState() => _BodyFoguinhoState();
}

class _BodyFoguinhoState extends State<BodyFoguinho> {
  List<String> fogoImages = [
    "fogo1.png",
    "fogo2.png",
    "fogo3.png",
    "fogo4.png",
    "fogo5.png",
    "fogo6.png",
    "fogo7.png",
    "fogo8.png",
    ];
  late int indexImage = fogoImages.length-1;
  String mainPath = "assets/images/";
  late String fogoImage = mainPath + fogoImages[indexImage]; 
  bool ganhou = false;

  void apagarFogo(){
    if(indexImage >0){
      setState(() {
        indexImage = indexImage-1 % fogoImages.length;
        fogoImage = mainPath + fogoImages[indexImage]; 
      });
    }else{
      setState(() {
        ganhou = true;
      });
    }
  }

  void resetar(){
    setState(() {
      indexImage = fogoImages.length-1;
      fogoImage = mainPath + fogoImages[indexImage]; 
      ganhou = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ganhou 
                       ? Text(
                          "Parabés, você ganhou!", 
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,)
                       : Image.asset(fogoImage) 
              ),
              Container(height: 50,),
              ganhou 
              ? ElevatedButton(
                  onPressed: (){
                    resetar();
                  },
                  child: const Text('Resetar'),
                )
              : ElevatedButton(
                  onPressed: (){
                    apagarFogo();
                  },
                  child: const Text('Apagar fogo'),
                )
            ],
          ),
    );
  }
}