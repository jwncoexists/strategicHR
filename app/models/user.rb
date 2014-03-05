class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, confirmation: true, 
            length: { minimum: 4 }, unless: :already_has_password?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_create { generate_token(:token) }
  before_save { |user| user.email = user.email.downcase }
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

  def video_minutes_total
    ((Stat.where(user_id: self.id).sum :total_time)/60).round(2)
  end

  def certificate_count
    Certificate.where(user_id: self.id).count
  end

  def quizzes_passed_count
    Attempt.where(user_id: self.id, passed: true).count
  end

  def quizzes_failed_count
    Attempt.where(user_id: self.id, passed: false).count
  end

  def last_video_access
    l = Log.where(user_id: self.id).order("created_at DESC").first
    if (l) then
      l.time
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      headercol = self.column_names
      headercol << "Video Minutes"
      headercol << "# Certificates"
      headercol << "Quizzes Passed"
      headercol << "Quizzes Failed"
      headercol << "Last Video Accessed"
      csv << headercol
      all.each do |user|
        rowdata = user.attributes.values_at(*self.column_names)
        rowdata << user.video_minutes_total
        rowdata << user.certificate_count
        rowdata << user.quizzes_passed_count
        rowdata << user.quizzes_failed_count
        rowdata << user.last_video_access
        csv << rowdata
      end
    end
  end

  private

    def already_has_password?
      !self.password_digest.blank?
    end
  
end