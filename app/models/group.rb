class Group < ApplicationRecord
    has_many :events, dependent: :destroy
    accepts_nested_attributes_for :events
    enum gender: { BoyBand: 0, GirlBand: 1, Band: 3 }



    def to_s
        "#{name}"
    end

    def events_count
        self.events.count
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
        last_date = (0-0-0)
        self.events.each do |event|
            if event.date > last_date
                last_date = event.date
            end
        end
        last_date.strftime("%Y %B %A")
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
