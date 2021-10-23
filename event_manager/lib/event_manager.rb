require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

$hash1 = {}
$hash2 = {}

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone(phone)
	phone = phone.gsub(/\D/, "")
	if phone.length == 11 && phone[0] == "1"
		phone[1..11]
	elsif phone.length != 10
		""
	else
		phone
	end
end

def peak_hour(reg_date)

	hour = reg_date.split(" ")[1].split(":")[0]
	if $hash1[hour].nil?
		$hash1[hour] = 1
	else
		$hash1[hour] += 1
	end	
end

def peak_day(reg_date)

  day = DateTime.strptime(reg_date, "%m/%d/%Y %k:%M").strftime("%A")
  if $hash2[day].nil?
  	$hash2[day] = 1
  else 
  	$hash2[day] += 1
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])
  
  phone = clean_phone(row[:homephone])

  peak_hour(row[:regdate])
	
  peak_day(row[:regdate])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
  p phone

end

p $hash2.key($hash2.values.max)
p $hash1.key($hash1.values.max)




