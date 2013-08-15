AppSondage::Application.routes.draw do

  match "/auth/:provider" => "sessions#new", :as => :login
  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout

  mount Rapidfire::Engine => "/questionnaires"

  root to: "rapidfire/question_groups#index"

end
