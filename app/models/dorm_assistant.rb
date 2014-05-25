class DormAssistant < ActiveRecord::Base

  validates :name, presence: true
  validates :id_num, presence: true, uniqueness: {message: "Warning! ID Number already exist."}
  validates :year, presence: true
  validates :course, presence: true
  validates :room, presence: true
  validates :scholarship_type, presence: {message: "Warning! Please select type of scholarship."}
  validates :num_hours, presence: true





end

