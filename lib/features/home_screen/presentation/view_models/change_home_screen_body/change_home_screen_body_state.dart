abstract class ChangeHomeScreenBodyState {}

final class ChangeHomeScreenBodyInitial extends ChangeHomeScreenBodyState {}

final class ChangeHomeScreenBodySuccess extends ChangeHomeScreenBodyState {
  final int newIndex;

  ChangeHomeScreenBodySuccess({required this.newIndex});
}
