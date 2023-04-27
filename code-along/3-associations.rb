# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company

puts "Companies: #{Company.all.count}"
puts "Contacts: #{Contact.all.count}"

apple = Company.find_by({"name" => "Apple"})
puts apple.inspect

cook = Contact.new
cook["first_name"] = "Tim"
cook["last_name"] = "Cook"
cook["email"] = "tim@apple.com"
cook["company_id"] = apple["id"]
cook.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federighi"
contact["email"] = "craig@apple.com"
contact["company_id"] = apple["id"]
contact.save

amazon = Company.find_by({"name" => "Amazon"})

contact2 = Contact.new
contact2["first_name"] = "Jeff"
contact2["last_name"] = "Bezos"
contact2["email"] = "jeff@amazon.com"
contact2["company_id"] = amazon["id"]
contact2.save

puts "Contacts: #{Contact.all.count}"

# 2. How many contacts work at Apple?


apple_contacts = Contact.where({"company_id" => apple["id"]})
puts "Apple Contacts: #{apple_contacts.count}"


# 3. What is the full name of each contact who works at Apple?

for contact in apple_contacts
    # read each contact row's first_name and last_name columns
    first_name = contact["first_name"]
    last_name = contact["last_name"]
    # display the first_name and last_name
    puts "#{first_name} #{last_name}"
  end