import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
 class OrderDetailListItemRow extends StatefulWidget {
   @override
   _OrderDetailListItemRowState createState() => _OrderDetailListItemRowState();
 }

 class _OrderDetailListItemRowState extends State<OrderDetailListItemRow> {
   @override
   Widget build(BuildContext context) {
     return Container(
           margin: const EdgeInsets.all(2),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10)
           ),
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network("https://onlineshop.aa.com.mm/images/thumbs/V0VsGV.jpg",width: 85,height: 100,fit: BoxFit.cover,)),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(5),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget>[
                           SizedBox(height: 10,),
                           AutoSizeText(
                             'Digital Display',
                             style: TextStyle(fontSize: 16.0),
                             maxLines: 1,
                           ),
                           AutoSizeText(
                             'Finger Strength Digital Digital Display',
                             style: TextStyle(fontSize: 14.0),
                             maxLines: 2,
                           ),
                           SizedBox(height: 10),
                           Row(children: <Widget>[
                             Icon(Icons.date_range,size: 12,color: Colors.cyan),
                             SizedBox(width: 2,),
                             AutoSizeText(
                               'Quality - 10',
                               style: TextStyle(fontSize: 13.0),
                               maxLines: 1,
                             ),
                           ]),
                           SizedBox(height: 5),
                           Row(children: <Widget>[
                             Icon(Icons.attach_money,size: 12,color: Colors.cyan),
                             SizedBox(width: 2,),
                             AutoSizeText(
                               'Price - 10000 Kyats',
                               style: TextStyle(fontSize: 13.0),
                               maxLines: 1,
                             ),
                           ]),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ],
           ),
         );

   }
 }
