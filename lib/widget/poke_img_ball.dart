import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImgBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.w),
              borderRadius: BorderRadius.circular(50.w),
            ),
            child: Image.asset(
              "images/pokeball.png",
              width: UIHelper.calculateImageSize(),
              height: UIHelper.calculateImageSize(),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: "${pokemon.id}",
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "",
              width: UIHelper.calculateImageSize(),
              height: UIHelper.calculateImageSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: UIHelper.getColorFromType(pokemon.type![0])),
            ),
          ),
        ),
      ],
    );
  }
}
