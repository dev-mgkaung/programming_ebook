import 'package:flutter/material.dart';
import 'package:programmingebook/models/network_model/book/book_model.dart';
import 'package:programmingebook/utils/back_press_widget.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/book_detail_page_body.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/screens/bookdetail/blocs/add_to_cart_bloc.dart';

class BookDetailPage extends StatefulWidget {
  final Book bookObject;
  BookDetailPage(this.bookObject);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool inCart;
  bool isFav;

  @override
  void initState() {
    inCart = false;
    isFav = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddToCartBloc>(
          create: (BuildContext context) => AddToCartBloc(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: BackPressIcon(),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          body: BlocBuilder<AddToCartBloc, String>(builder: (context, count) {
            return DetailsPageBody(widget.bookObject);
          }),
          bottomNavigationBar: BottomBar(widget.bookObject),
        ),
      ),
    );
  }
}
