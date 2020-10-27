
class FoodList 
{
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  FoodList({this.albumId, this.title, this.url, this.thumbnailUrl});

  FoodList.fromJSON(Map<String, dynamic> json) 
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
