class Banner < ActiveRecord::Base
  belongs_to :site

  scope :available_to_show, -> { where("max_showing > showed") }

  validates_presence_of :name, :image, :target_url, :target, :max_showing

  has_attached_file :image, :styles => { :medium => "300x100>", :thumb => "100x35>"}
  validates_attachment_content_type :image, :content_type => /\Aimage/
end