import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_flutter/utilities/colors.dart';

extension PokemonDataExt on PokemonData {
  Color get typeColor => types.first.type.name.colorValue;

  String get idValue {
    final stringId = id.toString();
    if (stringId.length == 1) {
      return '#00$stringId';
    } else if (stringId.length == 2) {
      return '#0$stringId';
    } else {
      return '#$stringId';
    }
  }
}

extension StringExt on String {
  Color get colorValue {
    switch (this) {
      case 'grass':
        return grass;
      case 'fire':
        return fire;
      case 'water':
        return water;
      case 'normal':
        return normal;
      case 'flying':
        return flying;
      case 'bug':
        return bug;
      case 'poison':
        return poison;
      case 'electric':
        return electric;
      case 'ground':
        return ground;
      case 'fighting':
        return fighting;
      case 'psychic':
        return psychic;
      case 'rock':
        return rock;
      case 'ice':
        return ice;
      case 'ghost':
        return ghost;
      case 'dragon':
        return dragon;
      case 'dark':
        return dark;
      case 'steel':
        return steel;
      case 'fairy':
        return fairy;
      default:
        return defaultColor;
    }
  }
}
