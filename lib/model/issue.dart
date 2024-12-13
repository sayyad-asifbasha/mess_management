class Issue {
  late String uid;
  late String raisedBy;
  late String title;
  late int upvotes;
  late int downvotes;

  // Default constructor
  Issue({
    required this.uid,
    required this.raisedBy,
    required this.title,
    required this.upvotes,
    required this.downvotes,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      uid: json['uid'],
      title: json['title'],
      raisedBy: json['raisedBy'],
      upvotes: json['upvotes'],
      downvotes: json['downvotes'],
    );
  }

  // Method for serialization to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'raisedBy': raisedBy,
      'title': title,
      'upvotes': upvotes,
      'downvotes': downvotes,
    };
  }
}
