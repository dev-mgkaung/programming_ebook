import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/newEvent/blocs/post_event.dart';
import 'package:programmingebook/screens/newEvent/blocs/post_state.dart';
import 'package:programmingebook/screens/newEvent/local_widgets/new_event_body.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';
import 'package:programmingebook/utils/back_press_widget.dart';
import 'blocs/post_bloc.dart';
import 'package:http/http.dart' as http;

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  AppRepository appRepository=new AppRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostBloc()..add(PostFetched()),
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "New Event List",
                  style: Styles.defaultTextStyle,
                ),
                leading: BackPressIcon(),
              ),
              body: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  return NewEventBody();
                },
              )),
        ));
  }
}
