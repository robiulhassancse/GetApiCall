class Photo {
  String? title, url, tumbnailUrl;
  int? albumId, id;

  Photo({
    this.title,
    this.url,
    this.tumbnailUrl,
    this.albumId,
    this.id,
  });
   Photo.toJson(Map<String,dynamic> e){
     albumId = e['albumId'];
     id =   e['id'];
     title = e['title'];
     url =  e['url'];
     tumbnailUrl =  e['thumbnailUrl'];
  }



}
