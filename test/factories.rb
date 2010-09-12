Factory.define :event do |e|
  e.sequence(:name) { |n| "event_#{n}" }
  e.live true
end

Factory.define :admin do |a|
  a.sequence(:email) {|n| "hello#{n}@makeascene.tv" }
  a.password 'letmein'
end