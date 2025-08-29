import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widget/poke_img_ball.dart';

class PokelistItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokelistItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type!.first),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemon.name ?? "", style: Constants.getPokeTextStyle()),
              Chip(
                label: Text(pokemon.type![0], style: Constants.getChipTextStyle()),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.w)),
              ),
              Expanded(child: PokeImgBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
