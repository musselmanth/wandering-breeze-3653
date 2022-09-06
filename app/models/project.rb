class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end

  def contestant_count
    contestants.count
  end

  def average_contestant_experience
    (contestants.sum(&:years_of_experience).to_f / contestant_count).round(1)
  end
end