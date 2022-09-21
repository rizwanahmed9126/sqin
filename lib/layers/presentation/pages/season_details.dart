import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite/fav_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/season/season_bloc.dart';
import 'package:sqin_task/layers/presentation/resusable_widgets/message_widget.dart';
import '../resusable_widgets/image_widget.dart';
import '../resusable_widgets/seasons_info.dart';
import '../resusable_widgets/series_details_content.dart';

class SeasonDetails extends StatefulWidget {
  final int id;
  final String url;

  const SeasonDetails({Key? key,required this.id,
    required this.url
  }) : super(key: key);

  @override
  State<SeasonDetails> createState() => _SeasonDetailsState();
}

class _SeasonDetailsState extends State<SeasonDetails> {
  


  @override
  void initState() {
    BlocProvider.of<FavoriteBloc>(context).isSeriesFavorite(widget.id.toString());
    BlocProvider.of<SeasonBloc>(context).showListing(widget.id);

    super.initState();
  }

  final controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        slivers: [
           SliverAppBar(
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: false,
            elevation: 0,
            stretch: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
              background: ImageWidget(
                imageNetworkPath: widget.url,
                defaultHeight: 150,

              )

            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([

                BlocBuilder<SeasonBloc, SeasonState>(
                    builder: ( context, state,) {
                      if (state is SeasonLoadedState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: ( context, state,) {
                                  if(state is IsFav){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FloatingActionButton(
                                        child: state.value? const Icon(Icons.favorite):const Icon(Icons.favorite_border),
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        onPressed: () {
                                          if(state.value){
                                            BlocProvider.of<FavoriteBloc>(context).removeFavorite(context,widget.id.toString());
                                          }
                                          else{
                                            BlocProvider.of<FavoriteBloc>(context).saveFavorite(context,widget.id.toString());

                                          }



                                        },
                                      ),
                                    );
                                  }

                                  else if(state is FavErrorState){
                                    return const MessageWidget(message:"Somthing went wrong");
                                  }

                                  return const CircularProgressIndicator();
                                }),



                            SeriesDetailsContent(
                              seriesDetails: state.seasonList,
                            ),
                            SeasonsInfoWidget(
                              seasons: state.seasonList.seasons,
                              //episodeOnTapAction: widget.presenter.goToEpisodeDetailsPage,
                            ),
                          ],
                        );
                      } else if (state is SeasonErrorState) {
                        return const Padding(
                          padding: EdgeInsets.all(64),
                          child: Center(
                            child: Text('Something Wrong Happened'),
                          ),
                        );
                      }
                      return const Padding(
                        padding: EdgeInsets.all(64),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    })
              ])
          ),
        ],
      )






    );
  }









}










