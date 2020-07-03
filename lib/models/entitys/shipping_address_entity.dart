
import 'package:programmingebook/services/persistances/data/local/database_provider.dart';

class ShippingAddressEntity  {
   int id;
   String title;
   String address;
   String city;
   String country;
   String postal;
   bool isChecked;

   ShippingAddressEntity({this.id,this.title, this.address, this.city, this.country,postal,this.isChecked});

   Map<String, dynamic> toMap() {
     var map = <String, dynamic>{
       DatabaseProvider.COLUMN_TITLE: title,
       DatabaseProvider.COLUMN_ADDRESS: address,
       DatabaseProvider.COLUMN_CITY: city,
       DatabaseProvider.COLUMN_COUNTRY: country,
       DatabaseProvider.COLUMN_POSTAL: postal,
       DatabaseProvider.COLUMN_CHECKED: isChecked ? 1: 0
     };
     if (id != null) {
       map[DatabaseProvider.COLUMN_ID] = id;
     }
     return map;
   }

   ShippingAddressEntity.fromMap(Map<String, dynamic> map) {
     id = map[DatabaseProvider.COLUMN_ID];
     title = map[DatabaseProvider.COLUMN_TITLE];
     address = map[DatabaseProvider.COLUMN_ADDRESS];
     city = map[DatabaseProvider.COLUMN_CITY];
     country = map[DatabaseProvider.COLUMN_COUNTRY];
     postal = map[DatabaseProvider.COLUMN_POSTAL] ;
     isChecked=map[DatabaseProvider.COLUMN_CHECKED]==1;
   }
}
