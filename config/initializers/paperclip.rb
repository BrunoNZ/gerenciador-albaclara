# ImageMagick must be installed
# PATH OF: $ which convert
Paperclip.options[:command_path] = "/usr/local/bin/"

Paperclip.options[:valid_file_names] = [
  /pdf\Z/, /txt\Z/, /png\Z/, /jpe?g\Z/,
  /docx?\Z/, /pptx?\Z/, /xlsx?\Z/, /pps\Z/, /odt\Z/
]

Paperclip.options[:valid_content_types] = %w(
  text/plain
  application/pdf
  application/msword
  image/png
  image/jpeg
  image/bmp
  image/tiff
  image/gif
  application/vnd.ms-excel
  application/vnd.ms-excel.addin.macroEnabled.12
  application/vnd.ms-excel.sheet.binary.macroEnabled.12
  application/vnd.ms-excel.sheet.macroEnabled.12
  application/vnd.ms-excel.template.macroEnabled.12
  application/vnd.ms-powerpoint
  application/vnd.ms-powerpoint.addin.macroEnabled.12
  application/vnd.ms-powerpoint.presentation.macroEnabled.12
  application/vnd.ms-powerpoint.slideshow.macroEnabled.12
  application/vnd.ms-powerpoint.template.macroEnabled.12
  application/vnd.ms-word.document.macroEnabled.12
  application/vnd.ms-word.template.macroEnabled.12
  application/vnd.openxmlformats-officedocument.presentationml.presentation
  application/vnd.openxmlformats-officedocument.presentationml.slideshow
  application/vnd.openxmlformats-officedocument.presentationml.template
  application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  application/vnd.openxmlformats-officedocument.spreadsheetml.template
  application/vnd.openxmlformats-officedocument.wordprocessingml.document
  application/vnd.openxmlformats-officedocument.wordprocessingml.template
  application/vnd.oasis.opendocument.chart
  application/vnd.oasis.opendocument.database
  application/vnd.oasis.opendocument.formula
  application/vnd.oasis.opendocument.graphics
  application/vnd.oasis.opendocument.graphics-template
  application/vnd.oasis.opendocument.image
  application/vnd.oasis.opendocument.presentation
  application/vnd.oasis.opendocument.presentation-template
  application/vnd.oasis.opendocument.spreadsheet
  application/vnd.oasis.opendocument.spreadsheet-template
  application/vnd.oasis.opendocument.text
  application/vnd.oasis.opendocument.text-master
  application/vnd.oasis.opendocument.text-template
  application/vnd.oasis.opendocument.text-web
)
