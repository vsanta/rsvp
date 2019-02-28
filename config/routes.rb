Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get '/:code', to: "invitees#index"
end
