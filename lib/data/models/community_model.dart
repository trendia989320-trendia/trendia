/// Community Model
/// Represents a learning community/group
class Community {
  final String id;
  final String name;
  final String description;
  final String icon;
  final int members;
  final String skill;
  final DateTime nextEventDate;
  final String eventTitle;
  bool isMember;

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.members,
    required this.skill,
    required this.nextEventDate,
    required this.eventTitle,
    this.isMember = false,
  });
}
