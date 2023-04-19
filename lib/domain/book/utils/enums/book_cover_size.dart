enum BookCoverSize {
  defaultThumbnail('thumbnail'),
  smallThumbnail('smallThumbnail'),
  mediumThumbnail('mediumThumbnail'),
  largeThumbnail('largeThumbnail'),
  small('small'),
  medium('medium'),
  extraLarge('extraLarge'),
  large('large');

  final String name;
  const BookCoverSize(this.name);
  static BookCoverSize from(String value) {
    if (BookCoverSize.values.map((e) => e.name).toList().contains(value)) {
      return BookCoverSize.values.firstWhere((e) => e.name == value);
    }
    return BookCoverSize.defaultThumbnail;
  }
}
