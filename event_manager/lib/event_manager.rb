require 'csv'
require 'sunlight/congress'
require 'erb'

template_letter = File.read "form_letter.erb.html"
erb_template = ERB.new template_letter

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone_number)
	phone_number = phone_number.to_s
	if phone_number.length < 10
		phone_number.rjust(10,"0")[0..9]
	elsif phone_number.length == 11 && phone_number[0] == "1"
		phone_number[1..10]
	else
		phone_number.rjust[0..9]
	end
end

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless Dir.exists? "output"

	filename = "output/thanks_#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts form_letter
	end
end

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	id = row[0]

	name = row[:first_name]

	zipcode = clean_zipcode(row[:zipcode])

	phone_number = clean_phone_number(row[:HomePhone])

	legislators = legislators_by_zipcode(zipcode)

	form_letter = erb_template.result(binding)

	save_thank_you_letters(id, form_letter)
end