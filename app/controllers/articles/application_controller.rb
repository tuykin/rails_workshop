class Articles::ApplicationController < ApplicationController
  http_basic_authenticate_with name: "viraj", password: "password", except: [:index, :show]

  protect_from_forgery with: :exception
end
