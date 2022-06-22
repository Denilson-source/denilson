part of extensions;

extension FileExt on File {
  String get fullName => this.path.split('/').last;
  String get name => this.path.split('/').last.split('.').first;
  String get extension => this.path.split('/').last.split('.').last;
}
