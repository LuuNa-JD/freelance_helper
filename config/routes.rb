Rails.application.routes.draw do

  root to: 'calculateur#formulaire'
  post 'calculer_tjm', to: 'calculateur#calculer_tjm'

end
