import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite/fav_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite_listing/fav_list_bloc.dart';
import 'package:sqin_task/layers/presentation/resusable_widgets/message_widget.dart';

import '../resusable_widgets/home_gridView.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final controller=ScrollController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
              builder: ( context, state,) {
                if(state is FavListLoadedState){
                  return buildList(controller: controller,list: state.favoriteList);

                }
                else if(state is FavListEmptyState){
                  return const MessageWidget(message: "Your favorite Series and TV Shows list is Empty :)");
                }

                else if (state is FavListErrorState) {
                  return const MessageWidget(message: "Something Wrong Happened");
                }

                // List<AllSeriesModel> posts = [];
                // //bool isLoading = false;
                //
                // if (state is ShowLoadingState) {
                //   posts = state.showList;
                //   //isLoading = true;
                // } else if (state is ShowListLoadedState) {
                //   posts = state.showList;
                // }

                return const Center(child: CircularProgressIndicator());
              }
              )
      ),
    );
  }
}
