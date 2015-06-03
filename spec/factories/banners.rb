FactoryGirl.define do
  factory :banner do
    association :site
    name "First test banner"
    target_url  'http://google.com'
    target  '_blank'
    showed  0
    clicks  0
    max_showing  500
    image_file_name  'third.png'
    image_content_type  'image/png'
    image_file_size  18932
  end
end