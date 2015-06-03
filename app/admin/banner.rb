ActiveAdmin.register Banner do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :site_id, :name, :image, :target_url, :target, :max_showing, :showed, :clicks

config.comments = false

index do
  column :id
  column :name
  column :site
  column :image_file_name
  column :target_url
  column :target
  column :max_showing
  column :showed
  column :clicks
  column :created_at
  column :updated_at
  actions
end

form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs do
    f.input :site
    f.input :name
    # f.input :map, :as => :file
    f.input :image, :as => :file
    f.input :max_showing
    f.input :target
    f.input :target_url
    f.input :showed
    f.input :clicks
    actions
  end

end


end
