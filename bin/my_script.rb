require 'addressable/uri'
require 'rest-client'

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name } }
  )
end

create_user("Gizmo", "gizmo@gizmo.gizmo")
