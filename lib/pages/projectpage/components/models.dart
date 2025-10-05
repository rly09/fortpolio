class Project {
  final String title;
  final String subtitle;
  final String imagePath;
  final List<String> tags;
  final String? url;
  const Project({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.tags,
    this.url,
  });
}