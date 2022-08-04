# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "Web client", redirect_uri: "", scopes: "")
end
