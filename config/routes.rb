Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  post '/confirma', to: "rsvp#create"
  get '/:code', to: "invitees#index"
end
