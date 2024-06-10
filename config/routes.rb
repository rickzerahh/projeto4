Rails.application.routes.draw do
  resources :livros
  resources :cursos
  resources :clientes
  resources :pedidos
end