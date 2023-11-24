class ConceptsList {
  final String id, title;

  ConceptsList({
    required this.id,
    required this.title,
  });
}

List myConcepts = [
  ConceptsList(
    id: "1",
    title: "State management in Flutter",
  ),
  ConceptsList(
    id: "2",
    title: "Bloc Pattern",
  ),
  ConceptsList(
    id: "3",
    title: "Clean Architecture",
  ),
  ConceptsList(
    id: "4",
    title: "Web Sockets",
  ),
  ConceptsList(
    id: "5",
    title: "Widgets and Navigation",
  ),
];
