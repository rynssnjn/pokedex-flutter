import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_type.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/type_card.dart';
import 'package:dartx/dartx.dart';
import 'package:rsj_f/rsj_f.dart';

class DataHeader extends StatelessWidget {
  const DataHeader({
    this.backgroundColor,
    this.name,
    this.id,
    this.imageURL,
    this.types,
    Key key,
  }) : super(key: key);

  final Color backgroundColor;
  final String name;
  final String id;
  final String imageURL;
  final List<PokemonType> types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(color: backgroundColor),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  fit: BoxFit.fill,
                  placeholder: (_, __) => Center(child: RSJCircularIndicator(size: 20)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: textTheme.headline1.copyWith(color: Colors.white),
                  ),
                  Text(
                    id,
                    style: textTheme.bodyText1.copyWith(color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: types.map((type) => TypeCard(name: type.name)).toUnmodifiable(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
