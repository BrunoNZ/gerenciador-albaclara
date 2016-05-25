class Document < ActiveRecord::Base
  has_attached_file :file

  # Validate content type
  validates_attachment_content_type :file,
    content_type: Paperclip.options[:valid_content_types]

  # Validate filename
  validates_attachment_file_name :file,
    matches: Paperclip.options[:valid_file_names]

  # Explicitly do not validate
  do_not_validate_attachment_file_type :file

end
