require 'machinist/active_record'


Patient.blueprint do
  patstamp {Time.gm(2012, 07, 13, 23, 5)}
  hospno{"456"}
end

Admission.blueprint do
  patient {Patient.make}
  admstamp {Time.gm(2012, 07, 13, 23, 5)}
end

ToDoItem.blueprint do
end

User.blueprint do
  email { "test2@example.com" }
  password { "password" }
end

