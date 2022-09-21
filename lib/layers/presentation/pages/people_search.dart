import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/data/models/get_all_people/get_all_people_model.dart';
//import 'package:provider/provider.dart';
import 'package:sqin_task/layers/presentation/pages/season_details.dart';

import '../../data/models/get_all_series/all_series_model.dart';
//import '../notifiers/home_notifier.dart';
import '../bloc/people_bloc/people_bloc.dart';
import '../bloc/show/show_bloc.dart';
import '../resusable_widgets/people_gridview.dart';
import '../routes.dart';


class PeopleSearch extends SearchDelegate{
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
    final controller=ScrollController();


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<PeopleBloc, PeopleState>(
          builder: ( context, state,) {
            if(state is LoadedState){
              List<PeopleModel> searchSuggection= state.showList.where((element)=> element.name.toLowerCase().contains(query.toLowerCase())
              ).toList();


              return dataGridview(controller: controller,list: searchSuggection);


            }


            else if (state is ShowErrorState) {
              return  Text('Shows!');
            }



            return  const Center(child: CircularProgressIndicator());
          }),
    );
  }

}