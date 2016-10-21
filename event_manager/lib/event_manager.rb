require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

template_letter = File.read "form_letter.erb.html"
erb_template = ERB.new template_letter

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone_number)
	number = phone_number.to_s.gsub(/\D/,"")
	if number.length < 10
		number.rjust(10,"0")[0..9]
	elsif number.length == 11 && number[0] == 1
		number[1..10]
	else
		number[0..9]
	end
end

def datetime(datetime)
	datetime = DateTime.strptime(datetime, '%m/%d/%Y %H:%M')
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
most_popular_hour = Hash.new(0)
most_popular_day = Hash.new(0)
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	id = row[0]

	name = row[:first_name]

	zipcode = clean_zipcode(row[:zipcode])

	phone_number = clean_phone_number(row[:homephone])

	reg_datetime = datetime(row[:regdate])

	most_popular_hour[reg_datetime.hour] += 1

	most_popular_day[Date::DAYNAMES[reg_datetime.wday]] += 1 

	legislators = legislators_by_zipcode(zipcode)

	form_letter = erb_template.result(binding)

	save_thank_you_letters(id, form_letter)
end
puts "The most popular hour is #{most_popular_hour.max_by{|k, v| v}[0]}" 
puts "The most popular day is #{most_popular_day.max_by{|k,v| v}[0]}"