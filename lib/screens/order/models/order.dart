class OrderItem
{
  final String orderId;
  final String orderDate;
  final int quality;
  final double totalAmount;
  final String orderStatus;

  OrderItem(this.orderId, this.orderDate, this.quality, this.totalAmount, this.orderStatus);

}

 List<OrderItem> delivered=[
  OrderItem("190212", "3 July 2020", 3, 20000,"Deleivered"),
  OrderItem("190213", "4 July 2020", 10, 30000, "Deleivered"),
  OrderItem("190216", "20 July 2020", 20, 50000, "Deleivered"),
];
 List<OrderItem> processing=[
  OrderItem("190212", "4 July 2020", 20, 50000,"Processing"),
  OrderItem("190213", "5 July 2020", 30, 80000, "Processing"),
  OrderItem("190215", "26 July 2020", 20, 50000, "Processing"),
  OrderItem("190216", "28 July 2020", 26, 50000, "Processing"),
];
 List<OrderItem> cancelling=[
  OrderItem("190212", "4 July 2020", 20, 50000,"Cancelled"),
  OrderItem("190213", "4 July 2020", 20, 50000,"Cancelled"),
];