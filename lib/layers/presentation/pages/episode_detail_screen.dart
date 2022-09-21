// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sqin_task/layers/presentation/notifiers/episodes_data_notifier.dart';
// import 'package:sqin_task/layers/presentation/routes.dart';
// import 'package:provider/provider.dart';
//
// class CreateTask extends StatefulWidget {
//   const CreateTask({Key? key}) : super(key: key);
//
//
//   @override
//   State<CreateTask> createState() => _CreateTaskState();
// }
//
// class _CreateTaskState extends State<CreateTask> {
//   final _myController = TextEditingController();
//
//
//   @override
//   void dispose() {
//     _myController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title:const Text("Add your Todo Task"),
//       ),
//       body: _body()
//
//     );
//   }
//
//   Widget _body(){
//     final isLoading = context.select((CreateTodoNotifier n) => n.isLoading);
//     final error = context.select((CreateTodoNotifier n) => n.error);
//     final list = context.select((CreateTodoNotifier n) => n.value);
//
//
//     if (error != null) {
//       return const Center(child:  Text("No Internet Connection"));
//     }
//    else if (!isLoading && list == null) {
//       return _showAddButton();
//     } else if (isLoading) {
//       return const Center(child:  CircularProgressIndicator());
//     }
//    else if (!isLoading && list != null) {
//       return _addAgain();
//     }
//     else {
//       return Container();
//     }
//
//   }
//
//
//   Widget _showAddButton(){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//          Consumer<CreateTodoNotifier>(
//            builder: (context,i,_){
//              return
//                TextField(
//                controller: _myController,
//                textAlign: TextAlign.center,
//                decoration: InputDecoration(
//                  hintText: 'Enter city name',
//                  errorText: i.txtFieldValidated ? 'Value Can\'t Be Empty' : null,
//                ),
//              );
//            },
//          ),
//         const SizedBox(height: 10,),
//         CupertinoButton(
//             color: Theme.of(context).backgroundColor,
//             onPressed: (){
//               if(_myController.text.isEmpty){
//                 context.read<CreateTodoNotifier>().setValidator(_myController.text.isEmpty ?true: false);
//                 return;
//               }
//
//              // if(context.read<CreateTodoNotifier>().txtFieldValidated){
//                 context.read<CreateTodoNotifier>().createTodo(_myController.text);
//
//             //  }
//
//             },
//             child: const Text("Add")),
//       ],
//     );
//   }
//
//   Widget _addAgain(){
//     return Center(
//       child: Column(
//        // crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text("Your Todo Task has been added"),
//           const SizedBox(height: 10,),
//           CupertinoButton(
//             color: Theme.of(context).backgroundColor,
//             onPressed: (){
//               context.read<CreateTodoNotifier>().clearValues();
//               Navigator.pushNamed(context, getScreenRoute);
//             },
//             child: const Text("Return to home"),
//           ),
//           CupertinoButton(
//             onPressed:(){
//               _myController.clear();
//               context.read<CreateTodoNotifier>().clearValues();
//             } ,
//             child: const Text("Add again"),
//           )
//         ],
//
//       ),
//     );
//   }
//
//
// }


import 'package:flutter/material.dart';


import '../../data/models/seasons_details/seasons_details_model.dart';
import '../resusable_widgets/image_widget.dart';
import 'listing_page.dart';

class EpisodeDetailsPage extends StatefulWidget {
  EpisodeEntity episode;
   EpisodeDetailsPage({
    Key? key,
    required this.episode
  }) : super(key: key);

  @override
  State<EpisodeDetailsPage> createState() => _EpisodeDetailsPageState();
}

class _EpisodeDetailsPageState extends State<EpisodeDetailsPage>  {

  late final ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

  }

  @override
  Widget build(BuildContext context) {
    if (widget.episode == null) {
      return const Scaffold(
        backgroundColor: Colors.grey,
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: SeriesDetailsSlidingAppBar(scrollController: controller),
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
                background: widget.episode != null
                    ? Hero(
                  tag: '${widget.episode.id}${widget.episode.name}',
                  child: ImageWidget(
                      imageNetworkPath: widget.episode.image.original),
                )
                    : const SizedBox()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                EpisodeDetailsContent(episode: widget.episode),
              ])),
        ],
      ),
    );
  }
}



class SeriesDetailsSlidingAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final ScrollController scrollController;

  const SeriesDetailsSlidingAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<SeriesDetailsSlidingAppBar> createState() => _SlidingAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _SlidingAppBarState extends State<SeriesDetailsSlidingAppBar> {
  Color _color = Colors.white;

  final duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      if (offset > 300) {
        setState(() {
          _color = Colors.black;
        });
      } else {
        setState(() {
          _color = Colors.white;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: _color,
    );
  }
}


class EpisodeDetailsContent extends StatelessWidget {
  final EpisodeEntity episode;
  const EpisodeDetailsContent({Key? key, required this.episode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode.name,
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 8,
          ),
          EpisodeNumberInfoWidget(
              number: episode.number, season: episode.seasonNumber),
          const SizedBox(
            height: 24,
          ),
          SummaryWidget(text: episode.summary),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}


class EpisodeNumberInfoWidget extends StatelessWidget {
  final String number;
  final String season;
  const EpisodeNumberInfoWidget({
    Key? key,
    required this.number,
    required this.season,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.headline3,
        children: [
          TextSpan(text: 'Season $season'),
          const TextSpan(
            text: '  ·  ',
          ),
          TextSpan(text: 'Episode $number'),
        ],
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  final String text;
  const SummaryWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Text(
        'No summary available.',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      );
    }

    return Text(
      _removeHtmlTags(text),
      style: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.justify,
    );
  }

  String _removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
