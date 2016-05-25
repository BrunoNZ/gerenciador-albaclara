class Document < ActiveRecord::Base
  has_attached_file :file

  # Validate content type
  validates_attachment_content_type :file,
    content_type: Paperclip.options[:valid_content_types]

  # Validate filename
  validates_attachment_file_name :file,
    matches: [
      /pdf\Z/, /txt\Z/, /png\Z/, /jpe?g\Z/,
      /docx?\Z/, /pptx?\Z/, /xlsx?\Z/, /pps\Z/, /odt\Z/
    ]

  # Explicitly do not validate
  do_not_validate_attachment_file_type :file

  puts Paperclip.options[:valid_content_types]

end
