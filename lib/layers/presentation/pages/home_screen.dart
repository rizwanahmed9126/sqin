import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqin_task/layers/presentation/pages/all_people_screen.dart';
import 'package:sqin_task/layers/presentation/pages/favorite_screen.dart';
import 'package:sqin_task/layers/presentation/pages/listing_page.dart';

import '../bloc/favorite_listing/fav_list_bloc.dart';
import '../bloc/people_bloc/people_bloc.dart';
import '../bloc/show/show_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    ListingPage(),
    FavoriteScreen(),
    PeopleScreen()
  ];

  void _initialDataFetch(){
    BlocProvider.of<ShowBloc>(context).showListing();
    BlocProvider.of<PeopleBloc>(context).showListing();
    BlocProvider.of<FavoriteListBloc>(context).showListing();


  }


  @override
  void initState() {
    _initialDataFetch();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.person),
            label: 'Perons',
          ),
        ],
      ),
    );
  }
}
