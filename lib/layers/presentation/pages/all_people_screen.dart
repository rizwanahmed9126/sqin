import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/people_bloc/people_bloc.dart';
import 'package:sqin_task/layers/presentation/pages/people_search.dart';
import 'package:sqin_task/layers/presentation/bloc/show/show_bloc.dart';
import '../resusable_widgets/message_widget.dart';
import '../resusable_widgets/people_gridview.dart';


class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}
class _PeopleScreenState extends State<PeopleScreen> {

  final controller=ScrollController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const  Text("All People"),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: PeopleSearch()
                );
              },
              icon: const Icon(Icons.search_sharp)
          )
        ],
      ),
      body:

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<PeopleBloc, PeopleState>(
            builder: ( context, state,) {
              if(state is LoadedState){
                return dataGridview(controller: controller,list: state.showList);


              }


              else if (state is ShowErrorState) {
                return const MessageWidget(message: "Something wrong",);
              }

              return  const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }




}













