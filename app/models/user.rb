class User < ActiveRecord::Base
  before_save :update_slug
  has_secure_password
  validates_presence_of :password, :on => :create
  before_create { generate_token(:token) }
  has_many :certificates
  has_many :attempts, dependent: :destroy

  ACCOUNTS = %w[member admin]
  def account?(base_account)
    account.nil? ? false : ACCOUNTS.index(base_account.to_s) <= ACCOUNTS.index(account)
  end 

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(6)
    end while User.exists?(column => self[column])
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end