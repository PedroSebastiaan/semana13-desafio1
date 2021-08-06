class Event < ApplicationRecord
    belongs_to :group

    validates :date, presence: true
    validates :participant, presence: true
    validates :duration, presence: true
end
