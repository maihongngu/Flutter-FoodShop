class Products 
{
  String id;
  String categoryId;
  String name;
  String avatar;

  Products({this.id, this.categoryId, this.name, this.avatar});

  Products.fromJson(Map<String, dynamic> json) 
  {
    id = json['id'];
    categoryId = json['CategoryId'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CategoryId'] = this.categoryId;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}