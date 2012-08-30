def with_header(header_message)
  puts header_message
  yield if block_given?
  puts ""
end

## Grades
#
with_header "Creating grades..." do
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
    puts "  #{title}"
    g = Grade.find_or_create_by_title(title)
    g.save
  end
end

## Shifts
#
with_header "Creating shifts..." do
  ["Day", "On Call"].each do |name|
    puts "  #{name}"
    Shift.find_or_create_by_name name
  end
end
  
## Teams
#
with_header "Creating defualt on-call teams" do
  ["Clinical","Surgical"].each do |team_name|
    Shift.all.each do |shift|
      puts " #{shift.name}: #{team_name}"
      team = { name: team_name, shift_id: shift.id }
      t = Team.where(team).first || Team.create(team)
      t.save
    end
  end
end
