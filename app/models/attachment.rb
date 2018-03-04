class Attachment < ApplicationRecord
  belongs_to :creator,class_name: 'User',foreign_key: 'created_by_id'
  belongs_to :updater,class_name: 'User',foreign_key: 'updated_by_id'

  attr_accessor :document
  has_attached_file :document, source_file_options: { all: '-auto-orient' }, :styles => lambda { |a| a.instance.is_image? ? {medium: '300x300>', thumb: '100x100>'} : {} }, default_url: AppConfig['attachment_default_url'], :restricted_characters => /[&$+,\/:;=?@<>\[\]\{\}\|\\\^~%# \(\)]/
  validates_attachment_content_type :document, size: { in: 1..1000.kilobytes }, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images with size less than 1 MB)'



  belongs_to :attachable, polymorphic: true, optional: true

  def url without_timestamp = false
    return "#{document.url}/" unless without_timestamp
    return "#{document.url(:original,timestamp: false)}"
  end

  def is_image?
    return false unless document.content_type
    AppConfig['valid_content_types']['content_type_image'].include?(document.content_type)
  end

  def get_file_icon_class
    AppConfig['file_icons'].detect {|file_types,icon_class| file_types.include?(document.content_type)}.try(:last) || 'fa fa-file'
  end

  def attachment_document_name
    self[:document_name]
  end

  def self.get_valid_file_types
    @@VALID_FILE_TYPES ||= AppConfig['valid_content_types'].map{|k,v| v.flatten}.flatten
  end

  def self.get_valid_file_types_pdf_only
    @@VALID_FILE_TYPES ||= AppConfig['valid_content_types']['content_type_pdf']
  end

  def complete_name enforece_file_name = false
    return document_file_name if enforece_file_name
  end

  def self.decode_base_64_image
    arr = ["data:image/jpeg","base64,"]
    arr.join(";")
  end
end
