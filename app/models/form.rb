class Form < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :submissions
  has_and_belongs_to_many :outputs

  validates :name, :website, presence: true
  before_create :generate_uuid, unless: :id

  attribute :input_fields, :jsonb, default: {}

  def generate_uuid
    self.id = SecureRandom.uuid
  end

  def satisfaction_avg
    submissions.average(:satisfaction)
  end

  def submissions_count
    submissions.count()
  end
end