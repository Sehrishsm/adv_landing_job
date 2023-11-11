import 'package:adv_job_landing/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {

  const PageContent({
    required this.image, required this.title, required this.description,
});
 const PageContent.first() : this(
   image: MediaRes.casualReading,
   title: 'Brand new curriculum',
   description: 'This is first online Educational Platform '
       'designed by '"the world's top Professors"
      ,
 );

  const PageContent.second(): this(
    image: MediaRes.casualLife,
    title: 'Brand a fun Atmosphere',
    description: 'This is first online Educational Platform designed by '
        "the world's top Professors",
  );

  const PageContent.third(): this(
    image: MediaRes.casualMeditation,
    title: 'Easy to join the lesson',
    description: 'This is first online Educational Platform designed by '
        "the world's top Professors",
  );

  final String image;
  final String title;
  final String description;

  @override

  List<Object?> get props => [image, title, description];
}
