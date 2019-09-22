desc "Import Articles"
namespace :import do
  task :articles => :environment do
    # code here
    begin
	    require 'csv'    
		csv_text = File.read("#{Rails.root}/articles.csv")
		csv = CSV.parse(csv_text, :headers => true, header_converters: lambda { |header| header == "Author" ? header = "author_id" : header == "Publishd At" ? header = "published_at" : header.downcase})
		csv.each do |row|
			row[1] = User.find_by(name: row[1]).id
		  Article.create!(row.to_hash)
		end
		p "Data imported succesfully"
  	rescue => e
  		p e.message
  	end	
  end
end
