class RegistrationsController < Devise::RegistrationsController
  layout "simple", except: [:edit, :update]
end