class CategoryModel {

    String name;
    String total;
    String description;
    String image;

    CategoryModel({ this.name, this.total, this.description, this.image});

    factory CategoryModel.fromJson(Map<String, dynamic> json) {
      return CategoryModel(
          name: json['name'] as String,
          total: json['total'] as String,
          description: json['description'] as String,
          image: json['image'] as String,
       );
    }

    Map<String, dynamic> toJson() => _CategoryModelToJson(this);


    Map<String, dynamic> _CategoryModelToJson(CategoryModel instance) => <String, dynamic>{
       'name': instance.name,
       'total': instance.total,
       'description': instance.description,
       'image': instance.image,
    };
}
