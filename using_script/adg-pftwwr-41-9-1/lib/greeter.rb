class Greeter
   def initialize(name = "World")
    @name = name
   end
   def say_hi
     puts "Hi #{@name}!"
   end
   def say_bye
     puts "Bye #{@name}, come back soon."
   end
 end
<<EOT
EOT
g = Greeter.new("Pat") # or your name
g.say_hi
g.say_bye

#g.@name
Greeter.instance_methods

Greeter.instance_methods(false)

g.respond_to?("name")

g.respond_to?("say_hi")

g.respond_to?("to_s")

