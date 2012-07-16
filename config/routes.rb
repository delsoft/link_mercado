Linkmercado::Application.routes.draw do
  # Rotas de usuários
  post "/usuarios" => "users#create"
  get  "/usuarios/novo" => "users#new"

  # Rotas de empresas
  get  "/empresas" => "companies#index", as: :companies
  post "/empresas" => "companies#create"
  get  "/empresas/novo" => "companies#new"

  # Rotas de sessão
  post "/entrar" => "sessions#create"
  get  "/sair" => "sessions#destroy"
  
  get "/painel" => "dashboard#index", as: :dashboard
  
  root to: 'home#index'
end
