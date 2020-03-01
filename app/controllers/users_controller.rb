class UsersController < ApplicationController
  def index
    @users = User.all
    @location_hash = Gmaps4rails.build_markers(@users.where.not(:address_latitude => nil)) do |user, marker|
      marker.lat user.address_latitude
      marker.lng user.address_longitude
      marker.infowindow "<h5><a href='/users/#{user.id}'>#{user.username}</a></h5><small>#{user.address_formatted_address}</small>"
    end

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end
end
