# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

# RuntimeError in Public::Customers#showの対策
Refile.secret_key = '6af702692b031b2366ed6f8537592f656f0c143c760ab5bae9fe4f33163564ea2805c16919cc8a5008afb6183e2c6fcad59901e3d6b856d704f0353a93175aeb'
