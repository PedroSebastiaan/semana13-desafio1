class Group < ApplicationRecord

    has_many :events, dependent: :destroy
    has_many :crews, dependent: :destroy
    accepts_nested_attributes_for :events
    accepts_nested_attributes_for :crews
    enum gender: { BoyBand: 0, GirlBand: 1, Band: 3 }

    validates :name, presence: true
    validates :debut_date, presence: true
    validates :gender, presence: true
    validates :member, presence: true

    def to_s
        name
    end

    def events_count
        total_events = 0
        self.events.each do |event|
            total_events += 1
        end 
        total_events
    end

    def current_events
        this_month = Time.now.month
        currently_events = 0 
        self.events.each do |event|
            if event.date.month == this_month
                currently_events += 1 
            end 
        end 
        currently_events 
    end

    def last_events
        last_date = Date.new(0000-00-0)
        self.events.each do |event|
            if event.date > last_date
                last_date = event.date
            end
        end
        if last_date != (0-0-0)
            last_date.strftime("%Y %B %A")
        else
            nil
        end
    end

    def max_part
        max_count = 0
        self.events.each do |event| 
            if event.participant > max_count 
            max_count = event.participant 
            end 
        end 
        max_count 
    end

    def long_event
        longest_event = 0 
        self.events.each do |event| 
            if event.duration > longest_event
                longest_event = event.duration
            end 
        end 
        longest_event 
    end
    
end
