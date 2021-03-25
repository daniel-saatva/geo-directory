require 'csv'
namespace :users do
  desc "Import users"
  task import_csv: :environment do
    filename = File.read("engineering.csv")
    csv = CSV.parse(filename, :headers => true)
    csv.each do |row|

      next if User.find_by(email: row['email'])
      location = Location.create_or_find_by!(lat: row["lat"],lng:row["lng"],country:row["country"],city:row["city"])
      user = User.new(row.to_hash.except("squad","lat","lng","country","city","start_date"))

      if row['squad'].present?
        squad = Squad.create_or_find_by!(name: row["squad"])
        user.squad = squad
      end

      user.location = location
      user.start_date = Date.strptime(row["start_date"], "%m/%d/%y")
      user.save
    end
  end
end
