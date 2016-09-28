class Survey < ActiveRecord::Base
  has_many :questions

  SURVEY_MODULES = ["Status", "Services", "Behavior", "Social", "Closing"]

  def self.codes
    {"Status" => "X7Gqv9",
     "Services" => "F2ptjY",
     "Behavior" => "n2QJzM",
     "Social" => "wVvdrY",
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
    when "social"
      self.codes["Social"]
    when "closing"
      self.codes["Closing"]
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


  def self.setup
    survey = Survey.create(name: "Health Status")
    self.data["questions"].each do |question|
      question = Question.find_or_create_by(identifier: question['id'], group: question['group'], question: question['question'], survey_id: survey.id)
    end
  end
end
