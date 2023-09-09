abstract class BottomNavEvent{}

class TabChangeEvent extends BottomNavEvent{
  final int tabindex;
  TabChangeEvent({required this.tabindex});
}