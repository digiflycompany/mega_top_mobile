abstract class HomeState {}

class HomeInitial extends HomeState {}

class ImageChanged extends HomeState {
  final int index;
  ImageChanged({required this.index});
}
class HomePageChanged extends HomeState {
  final int index;
  HomePageChanged({required this.index});
}