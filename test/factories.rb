Factory.define :event do |e|
  e.sequence(:name) { |n| "event_#{n}" }
  e.live true
end

