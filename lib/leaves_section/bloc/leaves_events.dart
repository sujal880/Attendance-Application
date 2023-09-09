abstract class LeavesEvents{
  const LeavesEvents();
}

class ReasonEvents extends LeavesEvents{
  final String reason;
  ReasonEvents(this.reason);
}

class DescriptionEvents extends LeavesEvents{
  final String description;
  DescriptionEvents(this.description);
}