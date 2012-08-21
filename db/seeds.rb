[
  "Foundation Year 1",
  "Foundation Year 2",
  "Speciality Trainee 1",
  "Speciality Trainee 2",
  "Speciality Trainee 3",
  "Speciality Trainee 4",
  "Speciality Trainee 5",
  "Speciality Trainee 6",
  "Speciality Trainee 7",
  "Speciality Trainee 8",
  "Consultant"
].each do |title|
  puts "Creating grade: '#{title}'"
  g = Grade.find_or_create_by_title(title)
  g.save
end
    
