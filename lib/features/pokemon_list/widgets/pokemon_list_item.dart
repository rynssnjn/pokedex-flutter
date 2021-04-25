import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/utilities/colors.dart';
import 'package:rsj_f/rsj_f.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    @required this.onTap,
    this.name,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: cardGradientBackground,
        ),
        padding: const EdgeInsets.only(top: 20.0),
        height: 200,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              fit: BoxFit.fill,
              placeholder: (_, __) => Center(child: RSJCircularIndicator(size: 20)),
            ),
            Text(name ?? '', style: textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
