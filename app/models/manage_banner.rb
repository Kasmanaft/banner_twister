class ManageBanner < ActiveRecord::Base
  belongs_to :site
  belongs_to :banner
end
