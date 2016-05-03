
require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  if ARGV.empty?
    puts "Here is a list of available commands:\n
        new    - Create a new contact\n
        list   - List all contacts\n
        show   - Show a contact\n
        search - Search contacts"
    return
  end

  case ARGV[0]
    when "list"
      num_contacts = 0
      CSV.foreach('contacts.csv') do |row|
        num_contacts += 1
        puts "#{num_contacts}: "+row[0]+" "+row[1]+"\n"
      end
      num_contacts = 
      puts "--\n#{num_contacts} records total"
    when "new"
      puts "Full name?"
      name = STDIN.gets.chomp
      puts "Email address?"
      email = STDIN.gets.chomp
      new_contact = [name,email]
      new_contact = new_contact.to_csv
      File.open("contacts.csv", "a+") do |io| 
        io.puts()
        io.puts(new_contact)
      end
      puts "New contact (#{name}) saved successfully"
  end
end