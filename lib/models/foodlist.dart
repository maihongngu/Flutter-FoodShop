

class FoodList 
{
  final String title;
  final String body;

  FoodList
  (
    {
      this.title, this.body
    }
  );

  factory FoodList.fromJson(Map<String , dynamic> json )
  {
    return FoodList
    (
      title: json["title"],
      body: json["body"],
    );
  }
}