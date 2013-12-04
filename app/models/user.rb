class User < ActiveRecord::Base
  before_save :update_slug
  has_secure_password

  ACCOUNTS = %w[member admin]
  def account?(base_account)
    account.nil? ? false : ACCOUNTS.index(base_account.to_s) <= ACCOUNTS.index(account)
  end 

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end