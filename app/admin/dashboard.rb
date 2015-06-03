ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ "The most popular banners" } do

    table_for Banner.order("clicks desc").limit(10) do |b|
      b.column("Name") { |banner| link_to banner.name, admin_banner_path(banner) }
      b.column("Image") { |banner| image_tag image_url(banner.image.url(:thumb)), alt: banner.image_file_name, title: banner.image_file_name }
      b.column("Clicks") { |banner| banner.clicks }
      b.column("Showed") { |banner| banner.showed }
      b.column("Max showing") { |banner| banner.max_showing }
      b.column("Created at") { |banner| banner.created_at.to_s(:short) }
    end
  end
end
