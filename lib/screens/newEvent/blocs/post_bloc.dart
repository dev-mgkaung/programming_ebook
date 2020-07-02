import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:programmingebook/screens/newEvent/blocs/post_event.dart';
import 'package:programmingebook/screens/newEvent/blocs/post_state.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final AppRepository appRepository=new AppRepository();

  PostBloc();

  @override
  get initialState => PostInitial();

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
      Stream<PostEvent> events,
      TransitionFunction<PostEvent, PostState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await appRepository.fetchPosts(0, 10);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostSuccess) {
          final posts = await appRepository.fetchPosts(currentState.posts.length, 10);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
            posts: currentState.posts + posts,
            hasReachedMax: false,
          );
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) => state is PostSuccess && state.hasReachedMax;

}