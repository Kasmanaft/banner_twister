class Site < ActiveRecord::Base
  has_many :banners, dependent: :destroy

  accepts_nested_attributes_for :banners, :allow_destroy => true

  validates_presence_of :name, :url

  after_create:set_banner_code


  private

  def set_banner_code
    self.banner_code = "<script type='text/javascript' src='http://localhost:3000/sites/#{ self.id }'></script>"
    self.save
  end
end
