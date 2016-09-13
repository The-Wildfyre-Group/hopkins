class User < ActiveRecord::Base
  include Census
  include Cells
  include Signup
  include Password
  include Partners

  before_save :encrypt_password
  before_save :set_region
  has_one :claimed_giftcard
  has_and_belongs_to_many :partners
  
  after_save :update_eligibility
  
  validates :email, uniqueness: true


  def name
    (first_name.present? && last_name.present?) ? [first_name, last_name].join(" ") : email
  end
  
  def update_eligibility
    eligibility = [age >= 18, race == "Black or African American", sex == "Male"].include?(false) ? false : true
    self.update_column(:eligible, eligibility)
  end

  def set_region
    self.region = Location.region(state)
  end

  def completed_survey(string)
    survey = Survey.data(string)
    completed_response = survey["responses"].select { |k,v| k["completed"] == "1" && k["hidden"]["id"] == id.to_s }
  end

  def completed_survey?(string)
    return true if completed_surveys.include?(string)
    completed_response = completed_survey(string)
    self.completed_surveys += [string] and save if completed_response.present?
  end

  def surveys_completed
    completed_surveys.uniq.size
  end

  def completed_all_surveys?
    surveys_completed == 5
  end

  def signup_age
    now = created_at.in_time_zone("Eastern Time (US & Canada)")
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def age
    now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
  
  def age_range
    return [18,34] if (18..34).to_a.include? age
    return [35,64] if (35..64).to_a.include? age
    return [65] if age > 64
  end

  # def self.unique_groups
  #   pluck(:groups).flatten.uniq.reject(&:empty?)
  # end
  #
  # def self.all_groups
  #   pluck(:groups).flatten.reject(&:empty?)
  # end
  #
  # def self.group_count
  #   hash = Hash.new(0)
  #   self.all_groups.each do |group|
  #     hash[group] = hash[group] + 1
  #   end
  #   hash.sort_by { |k,v| v }.reverse
  # end
  
  def assigned_giftcard?
    claimed_giftcard.present?
  end

  def check_surveys_completion
    return if completed_all_surveys?
    (["Status", "Services", "Behavior", "Psycho Social", "Closing"] - completed_surveys).each do |survey|
      completed_survey?(survey)
    end
    claim_giftcard! if completed_all_surveys?
  end

  def claim_giftcard!
    ClaimGiftcard.call(self)
    UserMailer.completed_surveys(self).deliver
  end
end
