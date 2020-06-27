class PopularBook {
  int id;
  String bookname;
  String image;
  String desc;
  String price;

  PopularBook({this.id, this.bookname, this.image, this.desc, this.price});

  PopularBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookname = json['bookname'];
    image = json['image'];
    desc = json['desc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookname'] = this.bookname;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['price'] = this.price;
    return data;
  }
}
