
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqin_task/layers/data/models/image_model/image_model.dart';

import '../get_episodes/episodes_data_model.dart';



class SeasonsDetailsModel {
    final int id;
     final String name;
     final String type;
    final  Image image;
    final  List<String> genres;
    final  Schedule schedule;
    final String summary;
    final List<SeasonEntity> seasons;
    final String status;

  const SeasonsDetailsModel({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.genres,
    required this.schedule,
    required this.summary,
    required this.seasons,
    required this.status,
  });
}


class SeriesDetailedInfoModel extends SeasonsDetailsModel {
  final int dtoId;
  final String dtoName;
  final String dtoType;
  final Image imageModel;
  final List<String> genresModel;
  final Schedule scheduleModel;
  final String dtoSummary;
  final List<SeasonEntity> seasonsModel;
  final String dtoStatus;

  SeriesDetailedInfoModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoType,
    required this.imageModel,
    //required this.ratingModel,
    required this.genresModel,
    required this.scheduleModel,
    required this.dtoSummary,
    required this.seasonsModel,
    required this.dtoStatus,
  }) : super(
    id: dtoId,
    name: dtoName,
    type: dtoType,
    image: imageModel,
    //rating: ratingModel,
    genres: genresModel,
    schedule: scheduleModel,
    summary: dtoSummary,
    seasons: seasonsModel,
    status: dtoStatus,
  );

  factory SeriesDetailedInfoModel.fromMap(Map<String, dynamic> map) {
    final seasons = _sortEpisodesBySeason(map).entries.map((item) => SeasonModel.fromMap(item.value)).toList();

    return SeriesDetailedInfoModel(
      dtoId: (map['id'] ?? ''),
      dtoName: (map['name'] ?? '').toString(),
      dtoType: (map['type'] ?? '').toString(),
      imageModel: Image.fromJson(map['image'] ?? {}),
      genresModel: List<String>.from(map["genres"].map((x) => x)),
      scheduleModel: Schedule.fromJson(map['schedule'] ?? {}),
      dtoSummary: (map['summary'] ?? '').toString(),
      seasonsModel: seasons,
      dtoStatus: (map['status'] ?? '').toString(),
    );
  }

  static Map<String, dynamic> _sortEpisodesBySeason(Map<String, dynamic> map) {
    final unsortedEpisodes = map['_embedded']['episodes'];

    if (unsortedEpisodes == null) {
      return const {};
    }

    final sortedEpisodes = <String, dynamic>{};

    for (final episode in (unsortedEpisodes as List)) {
      final season = episode['season'];

      if (season == null) continue;

      if (sortedEpisodes.containsKey(season.toString())) {
        (sortedEpisodes[season.toString()]['episodes'] as List).add(episode);
      } else {
        sortedEpisodes.addEntries([
          MapEntry(season.toString(), {
            "season": season.toString(),
            "episodes": [episode],
          })
        ]);
      }
    }

    return sortedEpisodes;
  }
}




class SeasonEntity {
  final String number;
  final List<EpisodeModel> episodes;

  const SeasonEntity({
    required this.number,
    required this.episodes,
  });
}

class SeasonModel extends SeasonEntity {
  final String dtoNumber;
  final List<EpisodeModel> episodesModel;

  SeasonModel({
    required this.dtoNumber,
    required this.episodesModel,
  }) : super(
    number: dtoNumber,
    episodes: episodesModel,
  );

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    final episodes = map['episodes'];

    return SeasonModel(
      dtoNumber: (map["season"] ?? '').toString(),
      episodesModel: episodes != null
          ? (episodes as List)
          .map((item) => EpisodeModel.fromMap(item))
          .toList()
          : const [],
    );
  }
}



class EpisodeModel extends EpisodeEntity {
  final String dtoId;
  final String dtoName;
  final String dtoNumber;
  final String dtoSeasonNumber;
  final Image imageModel;
  final String dtoSummary;

  EpisodeModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoNumber,
    required this.dtoSeasonNumber,
    required this.imageModel,
    required this.dtoSummary,
  }) : super(
    id: dtoId,
    name: dtoName,
    number: dtoNumber,
    seasonNumber: dtoSeasonNumber,
    image: imageModel,
    summary: dtoSummary,
  );

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      dtoId: (map['id'] ?? '').toString(),
      dtoName: (map['name'] ?? '').toString(),
      dtoNumber: (map['number'] ?? '').toString(),
      dtoSeasonNumber: (map['season'] ?? '').toString(),
      imageModel: Image.fromJson(map['image'] ?? {}),
      dtoSummary: (map['summary'] ?? '').toString(),
    );
  }
}


class EpisodeEntity {
  final String id;
  final String name;
  final String number;
  final String seasonNumber;
  final Image image;
  final String summary;

  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.number,
    required this.seasonNumber,
    required this.image,
    required this.summary,
  });
}


