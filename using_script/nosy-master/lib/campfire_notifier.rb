# encoding: utf-8

class CampfireNotifier
  def self.notify(status)
    campfire = Tinder::Campfire.new(status.person.campfire_subdomain, token: status.person.campfire_token)
    room = campfire.find_room_by_name(status.person.campfire_room)
    room.speak("« " + status.text + " »")
  end
end
