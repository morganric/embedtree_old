class ProviderPost < ActiveRecord::Base
  attr_accessible :post_id, :provider_id

  belongs_to :provider
  belongs_to :post

end
