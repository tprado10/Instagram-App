require 'watir'
require 'pry'
require 'rb-readline'
require 'awesome_print'


username = "healingpathdayspa"
password =  "Ces-dNK-P32-FUt"
user =  ["josephineskriver", "theweekend", "kendalljenner", "karliekloss"]

# open Browser, Nav to Login Page
Browser = Watir::Browser.new :chrome, switches: ['--incongnito']
Browser.goto "instagram.com/accounts/login/"

# nav to username and password fields, inject info
ap "Logging in..."
Browser.text_field(:name => "username").set "#{username}"
Browser.text_field(:name => "password").set "#{password}"

#click login button
Browser.button(:class => '_5f5mN       jIbKX KUBKM      yZn4P   ').click
sleep(2)

while true
    user.each { |val| 
        # navigate to user's profile
        Browser.goto "instagram.com/#{val}/"

        # if not following then follow 
        if Browser.button(:class => '_5f5mN       jIbKX  _6VtSN     yZn4P   ').exist?
            ap "Following #{val}"
            Browser.button(:class => '_5f5mN       jIbKX  _6VtSN     yZn4P   ').click
        elsif Browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').exist?
            ap "Following #{val}"
            Browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').click
        end
        # Confirm unfallow
        sleep(5)
        if Browser.button(:class => 'aOOlW -Cab_   ').exist?
            ap "unFollowing Confirmed #{val}"
            Browser.button(:class => 'aOOlW -Cab_   ').click
        end
    }
    puts "-------- #{Time.now} ---------"
    sleep (3600)
end 

Pry.start(binding)
