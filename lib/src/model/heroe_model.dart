// To parse this JSON data, do
//
//     final heroeModel = heroeModelFromJson(jsonString);

import 'dart:convert';

HeroeModel heroeModelFromJson(String str) => HeroeModel.fromJson(json.decode(str));

String heroeModelToJson(HeroeModel data) => json.encode(data.toJson());

class HeroeModel {
    HeroeModel({
        this.id,
        this.publisher,
        this.alterEgo,
        this.imgUrl,
        this.superHero,
        this.firstAppearance,
        this.bio,
        this.heroeModelAbstract,
        this.energy,
        this.fightingSkills,
        this.intelligence,
        this.speed,
        this.strength,
        this.durability,
    });
    String uniqueId; // creo este parametro adicional para manejar ids unicos en las peliculas
    String id;
    String publisher;
    String alterEgo;
    String imgUrl;
    String superHero;
    String firstAppearance;
    String bio;
    String heroeModelAbstract;
    int energy;
    int fightingSkills;
    int intelligence;
    int speed;
    int strength;
    int durability;

    factory HeroeModel.fromJson(Map<String, dynamic> json) => HeroeModel(
        id: json["id"],
        publisher: json["publisher"],
        alterEgo: json["alterEgo"],
        imgUrl: json["imgUrl"],
        superHero: json["superHero"],
        firstAppearance: json["firstAppearance"],
        bio: json["bio"],
        heroeModelAbstract: json["abstract"],
        energy: json["energy"],
        fightingSkills: json["fightingSkills"],
        intelligence: json["intelligence"],
        speed: json["speed"],
        strength: json["strength"],
        durability: json["durability"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "publisher": publisher,
        "alterEgo": alterEgo,
        "imgUrl": imgUrl,
        "superHero": superHero,
        "firstAppearance": firstAppearance,
        "bio": bio,
        "abstract": heroeModelAbstract,
        "energy": energy,
        "fightingSkills": fightingSkills,
        "intelligence": intelligence,
        "speed": speed,
        "strength": strength,
        "durability": durability,
    };
}



