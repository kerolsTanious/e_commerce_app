abstract class CategoryScreenBodyChangeState {}

final class CategoryScreenBodyChangeInitial
    extends CategoryScreenBodyChangeState {}

final class CategoryScreenBodyChange extends CategoryScreenBodyChangeState {
  final int newIndex;

  CategoryScreenBodyChange({required this.newIndex});
}
