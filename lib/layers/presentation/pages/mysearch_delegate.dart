import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';
import 'package:sqin_task/layers/presentation/pages/season_details.dart';

import '../../data/models/get_all_series/all_series_model.dart';
//import '../notifiers/home_notifier.dart';
import '../bloc/show/show_bloc.dart';
import '../routes.dart';


class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context)=>[
    IconButton(onPressed: (){
      if(query.isEmpty){
        close(context, null);
      }else{
        query='';


      }

    }, icon: const Icon(Icons.clear))

  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: (){
        close(context, null);
      }, icon: const Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context)=>Center(child: Text(query),);
  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))

  @override
  Widget buildSuggestions(BuildContext context) {

    return BlocBuilder<ShowBloc, ShowState>(
        builder: ( context, state,) {

          if(state is ShowLoadingState && state.isFirstFetch){
            return const Center(child: CircularProgressIndicator());

          }
          else if (state is ShowErrorState) {
          return  Text('Shows!');
          }

          List<AllSeriesModel> posts = [];
          //bool isLoading = false;

          if (state is ShowLoadingState) {
            posts = state.showList;
            //isLoading = true;
          } else if (state is ShowListLoadedState) {
            posts = state.showList;
          }



          List<AllSeriesModel> searchSuggection= posts.where((element)=> element.name.toLowerCase().contains(query.toLowerCase())
          ).toList();

          return ListView.separated(
            itemCount: searchSuggection.length,
            itemBuilder: (context, index) {
              final character = searchSuggection[index];
              return ListTile(
                onTap: (){
                  query=character.name;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SeasonDetails(id: searchSuggection[index].id,url: searchSuggection[index].image.original,)));

                  //Navigator.pushNamed(context, seasonDetailScreenRoute);


                },
                leading: SizedBox(
                  height:50,
                  width:50,
                  child: CachedNetworkImage(
                    imageUrl: character.image.original,
                    placeholder: (context, url) =>
                        Image.asset(
                          'assets/images/placeholder1.png',
                        ),
                    errorWidget: (context, url, error) =>
                    const Center(
                      child: Icon(Icons.info,
                        // height: 100,
                      ),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),

                // trailing: Container(
                //   height: 10,
                //   width: 40,
                //   child: Text("${character.image.original}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                // ),
                title: Text(character.name),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          );
        }
        );
  }

}