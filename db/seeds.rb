require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'list.csv'))
Invitee.import_csv(csv_text)