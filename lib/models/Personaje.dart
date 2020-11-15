class Personaje {
  int id;
  String name;
  String img;
  String nickname;
  String portrayed;
  String birthday;

  Personaje({
    this.id,
    this.portrayed,
    this.img,
    this.birthday,
    this.name,
    this.nickname,
  });

  Personaje.fromJson(Map<String, dynamic> json) {
    this.id = json['char_id'];
    this.name = json['name'];
    this.nickname = json['nickname'];
    this.birthday = json['birthday'];
    this.img = json['img'];
    this.portrayed = json['portrayed'];
  }
}
