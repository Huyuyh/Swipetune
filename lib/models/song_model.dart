class SongModel {
  String? songId;
  String? artistId;
  Artist? artist;
  String? songTitle;
  String? duration;
  String? releaseDate;
  String? songImgUrl;
  Null? playlistSongs;

  SongModel(
      {this.songId,
      this.artistId,
      this.artist,
      this.songTitle,
      this.duration,
      this.releaseDate,
      this.songImgUrl,
      this.playlistSongs});

  SongModel.fromJson(Map<String, dynamic> json) {
    songId = json['SongId'];
    artistId = json['ArtistId'];
    artist =
        json['Artist'] != null ? new Artist.fromJson(json['Artist']) : null;
    songTitle = json['Song_title'];
    duration = json['Duration'];
    releaseDate = json['ReleaseDate'];
    songImgUrl = json['song_img_url'];
    playlistSongs = json['PlaylistSongs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SongId'] = this.songId;
    data['ArtistId'] = this.artistId;
    if (this.artist != null) {
      data['Artist'] = this.artist!.toJson();
    }
    data['Song_title'] = this.songTitle;
    data['Duration'] = this.duration;
    data['ReleaseDate'] = this.releaseDate;
    data['song_img_url'] = this.songImgUrl;
    data['PlaylistSongs'] = this.playlistSongs;
    return data;
  }

  static fromList(data) {
    var list = data as List;
    return list.map((map) => SongModel.fromJson(map)).toList();
  }
}


class Artist {
  String? artistId;
  String? name;
  String? artisGenres;
  String? artistImgUrl;
  Null? songs;
  Null? accountArtists;

  Artist(
      {this.artistId,
      this.name,
      this.artisGenres,
      this.artistImgUrl,
      this.songs,
      this.accountArtists});

  Artist.fromJson(Map<String, dynamic> json) {
    artistId = json['ArtistId'];
    name = json['Name'];
    artisGenres = json['artis_genres'];
    artistImgUrl = json['artist_img_url'];
    songs = json['Songs'];
    accountArtists = json['AccountArtists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArtistId'] = this.artistId;
    data['Name'] = this.name;
    data['artis_genres'] = this.artisGenres;
    data['artist_img_url'] = this.artistImgUrl;
    data['Songs'] = this.songs;
    data['AccountArtists'] = this.accountArtists;
    return data;
  }

  static fromList(data) {
    var list = data as List;
    return list.map((map) => Artist.fromJson(map)).toList();
  }
}