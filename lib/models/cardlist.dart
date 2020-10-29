
class CartList 
{
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  CartList({this.albumId, this.title, this.url, this.thumbnailUrl});

  CartList.fromJSON(Map<String, dynamic> json) 
  {
    albumId = json['albumId'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
