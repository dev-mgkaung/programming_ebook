import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:programmingebook/models/network_model/popular/popular_book.dart';
import 'package:programmingebook/screens/home/blocs/popular_view_model.dart';
import 'package:programmingebook/services/base/api_stream_builder.dart';
import 'package:programmingebook/services/base/base_view.dart';
import 'package:programmingebook/widgets/base_screen_mixin.dart';
import 'package:programmingebook/widgets/error_widget.dart';
import 'package:programmingebook/widgets/loading_widget.dart';
import 'package:programmingebook/screens/home/local_widgets/popular_list_item.dart';

class HomePopularList extends StatefulWidget {
  @override
  _HomePopularListState createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList>
    with BaseScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<PopularViewModel>(
        onModelReady: (PopularViewModel popularViewModel) {
      if (popularViewModel.popularBookList == null) {
        popularViewModel.fetchPopularBookList();
      }
      onConnectionChange((value) {
        print(value);
        if (popularViewModel.popularBookList == null && value) {
          popularViewModel.fetchPopularBookList();
        }
      });
    }, builder: (BuildContext context, PopularViewModel popularViewModel,
            Widget child) {
      return ApiStreamBuilder<List<PopularBook>>(
        stream: popularViewModel.apiDataSinkStream,
        loadingWidget: (value) {
          showToast("loading value", context);
          return buildLoadingWidget();
        },
        errorWidget: (value) {
          print("errordata=$value");
          showToast(value.toString(), context);
          return buildErrorWidget(
            errorMessage: value.toString(),
            onRetryPressed: () => popularViewModel.fetchPopularBookList(),
          );
        },
        dataWidget: (value) {
          showToast("Data Show", context);
          return PopularList(popularlist: value);
        },
      );
    });
  }
}
