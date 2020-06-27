class CategoryBook {
   // int id;
    String name;
    String total;
    String description;
    String image;

    CategoryBook({ this.name, this.total, this.description, this.image});

    CategoryBook.fromJson(Map<String, dynamic> json) {
    //  id = json['id'] as int;
      name = json['name'];
      total = json['total'] ;
      description = json['description'];
      image = json['image'] ;
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['name'] = this.name ;
      data['total'] = this.total;
      data['description'] = this.description;
      data['image'] = this.image;
      return data;
    }


}
