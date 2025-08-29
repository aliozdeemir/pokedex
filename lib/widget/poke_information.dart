import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoRow("Name", pokemon.name),
            _buildInfoRow("Height", pokemon.height),
            _buildInfoRow("Weight", pokemon.weight),
            _buildInfoRow("Spawn Time", pokemon.spawnTime),
            _buildInfoRow("Weakness", pokemon.weaknesses!.join(", ")),
            _buildInfoRow("Prev Evolution", pokemon.prevEvolution),
            _buildInfoRow("Next Evolution", pokemon.nextEvolution),

          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Constants.getPokeInfoLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value is String)
          Text(
            value,
            style: Constants.getPokeInfoTextStyle(),
          )
        else
          Text(
            "Not Available",
            style: Constants.getPokeInfoTextStyle(),
          ),
      ],
    );
  }

}
