
extension StringExtension on String {
  get moveToAndRemoveCurrent => pushRoute(this, isToReplace: true);
  get moveTo => pushRoute(this);
}
