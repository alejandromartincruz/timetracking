Rails.application.routes.draw do
  get "/" => "sites#home"

  get "/contact" => "sites#contact"
end
