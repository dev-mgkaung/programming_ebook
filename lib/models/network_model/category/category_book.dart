class CategoryBook {
   // int id;
    String name;
    String total;
    String description;
    String image;

    CategoryBook({ this.name, this.total, this.description, this.image});

    CategoryBook.fromJson(Map<String, dynamic> json) {
    //  id = json['id'] as int;
      name = json['name'] as String;
      total = json['total'] as String;
      description = json['description'] as String;
      image = json['image'] as String;
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
     // data['id'] = this.id as int;
      data['name'] = this.name as String;
      data['total'] = this.total;
      data['description'] = this.description;
      data['image'] = this.image;
      return data;
    }


}
