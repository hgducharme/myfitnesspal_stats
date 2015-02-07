require_relative 'account'
require 'highline/import'

class Client
  def run
    username = ask("Username for MyfitnessPal:\s") { |q| q.echo }
    password = ask("Password for '#{username}':\s") { |q| q.echo = '*'}

    account = Account.new(username, password)
    status = account.login

    while status != false
      puts "What would you like to do?"
      response = gets.chomp
    end
  end # Client.run
end # class Client

client = Client.new
client.run