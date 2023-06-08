


class GenreModel {
  int? genreId;
  String? name;
  Null? description;
  Null? accountGenres;

  GenreModel({this.genreId, this.name, this.description, this.accountGenres});

  GenreModel.fromJson(Map<String, dynamic> json) {
    genreId = json['GenreId'];
    name = json['Name'];
    description = json['Description'];
    accountGenres = json['AccountGenres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GenreId'] = this.genreId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['AccountGenres'] = this.accountGenres;
    return data;
  }

  static fromList(data) {
    var list = data as List;
    return list.map((map) => GenreModel.fromJson(map)).toList();
  }
}