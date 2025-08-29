import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widget/poke_information.dart';
import 'package:pokedex/widget/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? buildPortraitBody(context)
        : buildLandscapeBody(context);
  }

  Scaffold buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(
        pokemon.type!.first,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 20.r,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            PokeTypeName(pokemon: pokemon),
            SizedBox(height: 20.h),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    height: 0.15.sh,
                    child: Image.asset(
                      "images/pokeball.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(
                      pokemon: pokemon,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: "${pokemon.id}",
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? "",
                        height: 0.25.sh,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                              color:
                                  UIHelper.getColorFromType(
                                    pokemon.type![0],
                                  ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(
        pokemon.type!.first,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 12.w,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Expanded(
                          child: Padding(
                            padding:
                                UIHelper.getDefaultPadding(),
                            child: Hero(
                              tag: "${pokemon.id}",
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img ?? "",
                                height: 0.20.sw,
                                fit: BoxFit.fitHeight,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                      color:
                                          UIHelper.getColorFromType(
                                            pokemon
                                                .type![0],
                                          ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInformation(
                        pokemon: pokemon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
