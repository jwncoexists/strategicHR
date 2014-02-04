class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  before_create { generate_token(:token) }
  has_many :certificates
  has_many :attempts, dependent: :destroy
  has_many :logs
  has_many :summaries

  ACCOUNTS = %w[member admin]
  def account?(base_account)
    account.nil? ? false : ACCOUNTS.index(base_account.to_s) <= ACCOUNTS.index(account)
  end 

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(6)
    end while User.exists?(column => self[column])
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
  
end