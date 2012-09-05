require 'machinist/active_record'


Patient.blueprint do
  patstamp { Time.gm(2012, 07, 13, 23, 5) }
  hospno   { "456" }
end

Admission.blueprint do
  patient  { Patient.make }
  admstamp { Time.gm(2012, 07, 13, 23, 5) }
end

ToDoItem.blueprint do
end

User.blueprint do
  email    { "test-#{sn}@example.com" }
  password { "password" }
  grade    { Grade.find_or_create_by_title "Foundation Year 1" }
end

PatientList.blueprint do
end

Grade.blueprint do
  title { "Foundation Year 1" }
end

Shift.blueprint do
  name { "On Call" }
end

Team.blueprint do
  name  { "A-Team" }
  shift { Shift.make!  }
end

HandoverList.blueprint do
  shift_date { Time.gm(2012,8,15,0,0).to_date  }
  team       { Team.make! }
end

Handover.blueprint do
  grade         { Grade.make! }
  handover_list { HandoverList.make! }
end
