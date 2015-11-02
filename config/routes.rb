Rails.application.routes.draw do

  get "/" => "sites#home"

  get "/contact" => "sites#contact"

  get "/projects"=> "projects#index"
  get "/projects/:project_id"=> "projects#show"

end
