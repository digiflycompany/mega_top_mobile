sealed class CompareClickState {}

final class CompareClickInitial extends CompareClickState {}

final class CompareClickSuccess extends CompareClickState {
  final bool isEmpty;
  CompareClickSuccess(this.isEmpty);
}

final class CompareClickSuccessFromComparePage extends CompareClickState {
  final bool isEmpty;
  CompareClickSuccessFromComparePage(this.isEmpty);
}
