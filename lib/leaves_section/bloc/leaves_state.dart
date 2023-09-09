class LeavesState {
  final String reason;
  final String description;
  LeavesState({this.reason = "", this.description = ""});

  LeavesState copyWith({String? reason, String? description}) {
    return LeavesState(
        reason: reason ?? this.reason,
        description: description ?? this.description);
  }
}
