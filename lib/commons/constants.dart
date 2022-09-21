class Urls {

  static String  seriesByIdUrl(int id)=>'https://api.tvmaze.com/shows/$id';
  static String  allPeopleUrl()=>'https://api.tvmaze.com/people';
  static String  seasonUrl(int page)=>'https://api.tvmaze.com/shows?page=$page';
  static String  episodesUrl(int id)=>'https://api.tvmaze.com/seasons/$id/episodes';
  static String  seasonsByIDUrl(int id)=>'https://api.tvmaze.com/shows/$id?embed=episodes';



}
