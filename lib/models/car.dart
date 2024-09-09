// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Car {
  String mat;
  String couleur;
  String energie;
  String options;

  Car({
    this.mat = "",
    this.couleur = "",
    this.energie = "",
    this.options = " ",
  });
  String get getMat => this.mat;

  set setMat(String mat) => this.mat = mat;

  get getCouleur => this.couleur;

  set setCouleur(couleur) => this.couleur = couleur;

  get getEnergie => this.energie;

  set setEnergie(energie) => this.energie = energie;

  get getOptions => this.options;

  set setOptions(options) => this.options = options;



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mat': mat,
      'couleur': couleur,
      'energie': energie,
      'options': options,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      mat: map['mat'] as String,
      couleur: map['couleur'] as String,
      energie: map['energie'] as String,
      options: map['options'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(mat: $mat, couleur: $couleur, energie: $energie, options: $options)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;


    return other.mat == mat &&
        other.couleur == couleur &&
        other.energie == energie &&
        other.options == options;
  }

  @override
  int get hashCode {
    return mat.hashCode ^
        couleur.hashCode ^
        energie.hashCode ^
        options.hashCode;
  }
}
