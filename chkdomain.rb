#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

sender_name = "John Doe"
sender_email = "john@doe.com"
recipient_name = "Strange Guy"
recipient_email = "strange@guy.com"

class Domains
	def initialize(*domains)
		@domains = domains
	end

	def check_dom(*domains)
		domains.each do |domain|
			url = "http://www.nic.cl/registry/Whois.do?d=#{domain}&buscar=Submit"

			doc = Nokogiri::HTML(open(url))

			data = doc.search("[text()*='Nombre de dominio no existe.']")

			if data.empty?
				puts "\nYour domain #{domain} is already registered :("
			else
				message = <<-END_OF_MESSAGE
				From: #{sender_name} <#{sender_email}>
				To: #{recipient_name} <#{recipient_email}>
				Subject: Domain #{domain} Available!
				Date: #{Time.now}

				Your domain #{domain} has just become available!
				Grab it while it lasts at https://clientes.nic.cl/registrar/agregarDominio.do
				END_OF_MESSAGE
				require 'net/smtp'
					Net::SMTP.start('localhost', 25) do |smtp|
	  			smtp.send_message message,
	                    'sender@host.domain.com',
	                    'recipient@domain.com'
					smtp.finish
				end
			end
		end
	end
end

newdom = Domains.new(*ARGV)
newdom.check_dom(*ARGV)
