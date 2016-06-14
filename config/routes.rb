Rails.application.routes.draw do
  namespace :students do
    get 'completed_lesson_parts/new'
  end

  namespace :students do
    get 'completed_lesson_parts/create'
  end

  root 'static_pages#index'

  resources :completions, only: [:destroy, :show]
  resources :lesson_parts
  resources :lessons
  resources :school_classes
  resources :students do
    resources :completed_lesson_parts, module: :students, only: [:create, :destroy, :index, :new, :show]
  end
  resources :teachers do
    resources :progress_of_students, module: :teachers, only: :index
    resources :teaches_students, module: :teachers, only: :index
  end
end
