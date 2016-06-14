Rails.application.routes.draw do
  root 'static_pages#index'

  resources :students do
    resources :completed_lesson_parts, module: :students, only: [:create, :new]
  end
  resources :teachers, only: [:index, :show] do
    resources :teaches_students, module: :teachers, only: :index
  end
end
