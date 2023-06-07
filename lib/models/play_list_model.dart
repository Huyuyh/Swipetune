import 'package:swipetune/models/song_model.dart';

class PlayListModel {
  String? playlistId;
  String? accountId;
  String? name;
  String? created;
  String? playlistImgUrl;
  bool? isPublic;
  List<SongModel>? playlistSongs;

  PlayListModel(
      {this.playlistId,
      this.accountId,
      this.name,
      this.created,
      this.playlistImgUrl,
      this.isPublic,
      this.playlistSongs});

  PlayListModel.fromJson(Map<String, dynamic> json) {
    playlistId = json['PlaylistId'];
    accountId = json['AccountId'];
    name = json['Name'];
    created = json['Created'];
    playlistImgUrl = json['playlist_img_url'];
    isPublic = json['isPublic'];
    if (json['PlaylistSongs'] != null) {
      playlistSongs = <SongModel>[];
      json['PlaylistSongs'].forEach((v) {
        playlistSongs!.add(new SongModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlaylistId'] = this.playlistId;
    data['AccountId'] = this.accountId;
    data['Name'] = this.name;
    data['Created'] = this.created;
    data['playlist_img_url'] = this.playlistImgUrl;
    data['isPublic'] = this.isPublic;
    if (this.playlistSongs != null) {
      data['PlaylistSongs'] =
          this.playlistSongs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static fromList(data) {
    var list = data as List;
    return list.map((map) => PlayListModel.fromJson(map)).toList();
  }
}
