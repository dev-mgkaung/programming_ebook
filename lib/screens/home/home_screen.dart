import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/network_model/popular/popular_book.dart';
import 'package:programmingebook/services/base/api_stream_builder.dart';
import 'package:programmingebook/services/base/base_view.dart';
import 'package:programmingebook/widgets/base_screen_mixin.dart';
import 'package:programmingebook/widgets/error_widget.dart';
import 'package:programmingebook/widgets/loading_widget.dart';
import '../../screens/home/local_widgets/home_search_box.dart';
import '../../screens/home/local_widgets/home_tab_bar.dart';
import 'blocs/popular_view_model.dart';
import 'local_widgets/popular_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseScreenMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

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
      return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => popularViewModel.fetchPopularBookList(),
          child: new ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSearchBox(),
                  HomeTabBar(),
                  Padding(padding: EdgeInsets.only(left: 16, top: 10),
                    child: Text('popular'.tr().toString(), style: Styles.mediumTextStyle),
                  ),
                  ApiStreamBuilder<List<PopularBook>>(
                    stream: popularViewModel.apiDataSinkStream,
                    loadingWidget: (value) {
                      return buildLoadingWidget();
                    },
                    errorWidget: (value) {
                      return buildErrorWidget(
                        errorMessage: value.toString(),
                        onRetryPressed: () =>
                            popularViewModel.fetchPopularBookList(),
                      );
                    },
                    dataWidget: (value) {
                      return PopularList(popularlist: value);
                    },
                  ),
                ],
              )
            ],
          ));
    });
  }
}
