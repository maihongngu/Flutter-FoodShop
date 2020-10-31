class Products 
{
  String id;
  String categoryId;
  String name;
  String image;

  Products({this.id, this.categoryId, this.name, this.image});

  Products.fromJson(Map<String, dynamic> json) 
  {
    id = json['id'];
    categoryId = json['CategoryId'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CategoryId'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}