CKEDITOR.editorConfig = function (config) {
  config.toolbar_mini = [
    ["Link", "Image", "Table", "HorizontalRule"],
    ["Bold", "Underline", "Strike"],
    ["FontSize", "TextColor"],
    ["code"],
    ["Recommend"],
    ["document"]
  ];
  config.language = 'ja';
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";
  config.allowedContent = true;
}
