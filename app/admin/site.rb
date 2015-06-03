ActiveAdmin.register Site do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :url, :_delete, banners_attributes: [:id, :name, :image, :target_url, :target, :max_showing, :_delete]

config.comments = false

filter :name
filter :url
filter :banners
filter :created_at
filter :updated_at

index do
  column :id
  column :name
  column :url
  column :banners
  column :created_at
  column :updated_at
  actions
end

show do
    attributes_table do
      row :id
      row :name
      row :url
      row :created_at
      row :updated_at
      row :banner_code
    end
  end

form do |f|
  f.inputs do
    f.input :name
    f.input :url
  end
  f.has_many :banners, heading: false , allow_destroy: true do |b|
      b.input :id, as: :hidden
      b.input :name
      b.input :image, :as => :file
      b.input :target_url
      b.input :target
      b.input :max_showing
  end
  actions
end

end
