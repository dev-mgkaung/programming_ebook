class PopularBook {
  String bookname;
  String image;
  String desc;
  String price;

  PopularBook({ this.bookname, this.image, this.desc, this.price});

  PopularBook.fromJson(Map<String, dynamic> json) {
    bookname = json['bookname'];
    image = json['image'];
    desc = json['desc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookname'] = this.bookname;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['price'] = this.price;
    return data;
  }
}
