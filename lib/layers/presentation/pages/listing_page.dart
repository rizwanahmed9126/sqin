import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/show/show_bloc.dart';
import 'package:sqin_task/layers/presentation/resusable_widgets/message_widget.dart';
import '../../data/models/get_all_series/all_series_model.dart';
import '../../data/services/storage.dart';
import '../resusable_widgets/home_gridView.dart';
import '../routes.dart';
import 'mysearch_delegate.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<ListingPage> {

   final controller=ScrollController();



   void setupScrollController() {
     controller.addListener(() {
       if (controller.position.atEdge) {
         if (controller.position.pixels != 0) {
           BlocProvider.of<ShowBloc>(context).showListing();
         }
       }
     });
   }

  @override
  void initState() {
     setupScrollController();


    //context.read<ShowBloc>().on((event, emit) => null);

      // ..addListener(() {
      //   if (controller.position.pixels >=
      //       controller.position.maxScrollExtent - 500) {
      //     context.read<ShowBloc>().pagination();
      //
      //    // widget.presenter.loadMoreSeries();
      //   }
      // });

    super.initState();
  }
_logout()async{
  var storageService = StorageService();
  await storageService.clearData();
  Navigator.pushNamed(context, loginScreenRoute);

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(onPressed: ()async{
              _logout();

            }, icon: Icon(Icons.logout)),
            InkWell(
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen()));
              },
                child: const  Text("All Shows")
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: MySearchDelegate()
                );
              },
              icon: const Icon(Icons.search_sharp)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ShowBloc, ShowState>(
            builder: ( context, state,) {
              if(state is ShowLoadingState && state.isFirstFetch){
                return const Center(child: CircularProgressIndicator());

              }


          else if (state is ShowErrorState) {
            return const MessageWidget(message: "Something Went Wrong");
          }

              List<AllSeriesModel> posts = [];

              if (state is ShowLoadingState) {
                posts = state.showList;
                //isLoading = true;
              } else if (state is ShowListLoadedState) {
                posts = state.showList;
              }

          return  buildList(controller: controller,list: posts);
        }),
      ),
    );
  }




}












// if (state is ShowInitialState) {
//   context.read<ShowBloc>().showListing();
//   return const Center(child: CircularProgressIndicator());
// } else if (state is ShowLoadingState) {
//   return SmartRefresher(
//     enablePullUp: true,
//     controller: context.read<ShowBloc>().refreshController,
//     onLoading: (){
//       context.read<ShowBloc>().pagination();
//
//       //_refreshController.refreshCompleted();
//
//
//     },
//
//     child: ListView.separated(
//       itemCount: state.showList.length,
//       itemBuilder: (context, index) {
//         final character = state.showList[index];
//         return ListTile(
//           onTap: (){
//             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SeasonDetails(allSeriesModel: character,)));
//
//             //Navigator.pushNamed(context, seasonDetailScreenRoute);
//
//           },
//           leading: SizedBox(
//             height:50,
//             width:50,
//             child: CachedNetworkImage(
//               imageUrl: character.image.original,
//               placeholder: (context, url) =>
//                   Image.asset(
//                     'assets/images/placeholder1.png',
//                   ),
//               errorWidget: (context, url, error) =>
//               const Center(
//                 child: Icon(Icons.info,
//                   // height: 100,
//                 ),
//               ),
//               fit: BoxFit.fill,
//             ),
//           ),
//
//           // trailing: Container(
//           //   height: 10,
//           //   width: 40,
//           //   child: Text("${character.image.original}",maxLines: 1,overflow: TextOverflow.ellipsis,),
//           // ),
//           title: Text(character.name),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const Divider();
//       },
//     ),
//   );
// } else if (state is ShowListLoadedState) {
//   final list=state.showList;
//   return
//   //   SmartRefresher(
//   //     enablePullUp: true,
//   //     controller: context.read<ShowBloc>().refreshController,
//   //     onLoading: (){
//   //       context.read<ShowBloc>().pagination();
//   //
//   //     },
//   //     child: RepaintBoundary(
//   //       child: MasonryGridView.count(
//   //         controller: controller,
//   //         physics: const BouncingScrollPhysics(),
//   //         crossAxisCount: 2,
//   //         mainAxisSpacing: 24,
//   //         crossAxisSpacing: 16,
//   //         itemCount: list.length,
//   //         itemBuilder: (context, index) {
//   //           return SeriesCard(
//   //             key: ValueKey(index),
//   //             heroTag: 'home${list[index].id}',
//   //             index: index,
//   //             seriesInfoItem: list[index],
//   //             // onTap: widget.presenter.goToSeriesDetailsPage,
//   //           );
//   //         },
//   //       ),
//   //     )
//   // );
//
//
//     SmartRefresher(
//     enablePullUp: true,
//     controller: context.read<ShowBloc>().refreshController,
//     onLoading: (){
//       context.read<ShowBloc>().pagination();
//
//       //_refreshController.refreshCompleted();
//
//
//     },
//
//     child: ListView.separated(
//       itemCount: state.showList.length,
//       itemBuilder: (context, index) {
//         final character = state.showList[index];
//         return ListTile(
//           onTap: (){
//             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SeasonDetails(allSeriesModel: character,)));
//
//             //Navigator.pushNamed(context, seasonDetailScreenRoute);
//
//           },
//           leading: SizedBox(
//             height:50,
//             width:50,
//             child: CachedNetworkImage(
//               imageUrl: character.image.original,
//               placeholder: (context, url) =>
//                   Image.asset(
//                     'assets/images/placeholder1.png',
//                   ),
//               errorWidget: (context, url, error) =>
//               const Center(
//                 child: Icon(Icons.info,
//                   // height: 100,
//                 ),
//               ),
//               fit: BoxFit.fill,
//             ),
//           ),
//
//           // trailing: Container(
//           //   height: 10,
//           //   width: 40,
//           //   child: Text("${character.image.original}",maxLines: 1,overflow: TextOverflow.ellipsis,),
//           // ),
//           title: Text(character.name),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const Divider();
//       },
//     ),
//   );
//}