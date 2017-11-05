Rails.application.routes.draw do
  root 'dash_board#show'
  mount GrapeApp::V1 => '/'
end
