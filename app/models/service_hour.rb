class ServiceHour < ActiveRecord::Base

  validates :area, presence: true
  validates :time_start, presence: true, uniqueness: {message: "Warning! Overlapping hour(s) with another DA."}
  validates :time_end, presence: true, uniqueness: {message: "Warning! Overlapping hour(s) with another DA."}


end
