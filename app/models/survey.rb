class Survey < ActiveRecord::Base
  has_many :questions

  SURVEY_MODULES = ["Status", "Services", "Behavior", "Psycho Social", "Closing"]

  def self.codes
    {"Status" => "X7Gqv9",
     "Services" => "F2ptjY",
     "Behavior" => "n2QJzM",
     "Psycho Social" => "wVvdrY",
     "Closing" => "vQ03Un",
     "Consent" => "Wq58eg",
     }
  end

  def self.find_code(action)
    case action
    when "status"
      self.codes["Status"]
    when "services"
      self.codes["Services"]
    when "behavior"
      self.codes["Behavior"]
    when "psychosocial"
      self.codes["Psycho Social"]
    when "closing"
      self.codes["Closing"]
    when "consent"
      self.codes["Consent"]
    end
  end

  def self.json_url(string)
    "https://api.typeform.com/v0/form/#{Survey.codes[string]}?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd"
  end

  def self.src(action, id)
    first = User.find(id).first_name
    "https://wildfyre.typeform.com/to/#{self.find_code(action)}?id=#{id}&amp;first=Cordis&amp;embed=full"
  end

  def self.data(string)
    survey = HTTParty.get(self.json_url(string))
  end


  SCORING = {
    "Rarely or none of the time (Less than 1 day)" => 0,

    #answers that hold a value of 1
    "Yes"           => 1,
    "A Little"      => 1,
    "Excellent"     => 1,
    "Very Easy"     => 1,
    "Some or a little of the time (1-2 days)" => 1,
    "Doctor’s office or HMO" => 1,
    "Male" => 1,

    #answers that hold a value of 2
    "No"            => 2,
    "Some"          => 2,
    "Very Good"     => 2,
    "Somewhat Easy" => 2,
    "Occasionally or a moderate amount of time (3-4 days)" => 2,
    "Clinic or health center" => 2,
    "Female" => 2,

    #answers that hold a value of 3
    "A Lot"         => 3,
    "Good"          => 3,
    "Not So Easy"   => 3,
    "Most or all of the time (5-7 days)" => 3,
    "Hospital outpatient department" => 3,

    #answers that hold a value of 4
    "Fair"          => 4,
    "Unable to do"  => 4,
    "Hospital emergency room" => 4,

    #answers that hold a value of 5
    "Poor"       => 5,
    "Some Other Place" => 5,

    "Don't Know" => 8,
    "Refuse"     => 9,
  }

  def self.setup
    survey = Survey.create(name: "Health Status")
    self.data["questions"].each do |question|
      question = Question.find_or_create_by(identifier: question['id'], group: question['group'], question: question['question'], survey_id: survey.id)
    end
  end
end
