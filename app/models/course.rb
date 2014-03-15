class Course < ActiveRecord::Base
  before_save :update_slug
  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections
  has_many :quizzes, through: :sections
  has_many :attempts
  accepts_nested_attributes_for :sections, allow_destroy: true
  has_many :certificates
  has_many :ceus, dependent: :destroy
  accepts_nested_attributes_for :ceus, allow_destroy: true
  has_many :resources, dependent: :destroy
  accepts_nested_attributes_for :resources, allow_destroy: true
  
  mount_uploader :handout, HandoutUploader
  mount_uploader :image, ImageUploader

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end

  def remove_changed_handout
    self.remove_handout!
    self.handout = nil
    self.save
  end


  def remove_changed_image
    self.remove_image!
    self.image = nil
    self.save
  end


  def video_minutes_total
    ((Stat.where(course_id: self.id).sum :total_time)/60).round(2)
  end

  def certificate_count
    Certificate.where(course_id: self.id).count
  end

  def quizzes_passed_count
    # Attempt.where(user_id: self.id, passed: true).count
    count = 0
    Section.where(course_id: self.id).each do |section|
      count = count + section.attempts.where(passed: true).count
    end
    count
  end

  def quizzes_failed_count
    #Attempt.where(user_id: self.id, passed: false).count
    count = 0
    Section.where(course_id: self.id).each do |section|
      count = count + section.attempts.where(passed: false).count
    end
    count
  end

  # return id of first section which user hasn't passed quiz for, return nil if all passed, or not released
  def next_incomplete_section(user_id)
    if (self.released)
      # loop through, stopping at the first section without a passing attempt
      self.sections.order('id ASC').each do |section|
        if (section.attempts.where(passed: true).count == 0)
          return section
        end
      end 
    end
    nil
  end

  # Not Started, In Progress, Course Completed, Certificate Purchased, Quiz Complete
  def my_status(user_id)
    return_status = "Coming Soon! This elearning course is not yet available."
    if (self.released)
      if (!self.certificates.where(user_id: user_id).empty?)
          return_status = "Course Completed! Certificate Purchased."
      else
        if (!Stat.where(user_id: user_id, course_id: self.id).empty?) ||
           (!self.attempts.empty?)
          return_status = "In Progress"
        else
          return_status = "Not Started"
        end
        all_sections_complete = true
        self.sections.each do |section|
          if (section.attempts.where(user_id: user_id, passed: true).empty?)
            all_sections_complete = false
          end
        end
        if (all_sections_complete)
          return_status = "Quiz".pluralize(self.sections.count) + " Complete"
        end
      end
    end
    return_status
  end

end
