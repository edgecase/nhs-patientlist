require 'machinist/active_record'


Patient.blueprint do
  patstamp {Time.gm(2012, 07, 13, 23, 5)}
end

Admission.blueprint do
  patient {Patient.make}
  admstamp {Time.gm(2012, 07, 13, 23, 5)}
end

