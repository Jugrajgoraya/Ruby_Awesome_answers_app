Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resource :session, only: [:new, :create]
  # Inside of this is where we define what resources we want available to users
  
  resources :questions do 
    # Routes written inside of a block passed to
    # a resources method will be pre-fixed by 
    # a path corresponding to the passed in symbol. 
    # In this case, all nested routes will be pre-fixed
    # with '/questions/:question_id'
    resources :answers, only: [:create, :destroy]
    # equivalent to: 
    # resources :answers, except: [:show, :index, :new, :edit, :update]
    # question_answerss_path(<question-id>)
    # question_answer_url(<question-id>)
    # question_answers_path(@question)
  end

  # VERB     PATH       CONTROLLER    PUBLIC METHOD
  # 👇          👇            👇         👇
  # get("/hello_world", to: "welcome#hello_world") # when someone visits GET "/hello_world" they are sent to the welcome controller, hello_world action.

  # get("/questions", to: "questions#index")

  # get("/questions/new", to: "questions#new", as: :new_question)

  # post("/questions", to: "questions#create")

  # get("/questions/:id", to: "questions#show", as: :question)

  # delete("questions/:id", to: "questions#destroy")

  # get("/questions/:id/edit", to: "questions#edit", as: :edit_question)

  # patch("/questions/:id", to: "questions#update")

  # or we can do all this with ruby convention 

  # ---resources :questions ---#build the CRUD RESTful routes. (all of the above routes for questions)

  # GET "/" WelcomeController.root method gets called
  get("/", to: "welcome#root")

  # GET "/contact_us"
  get("/contact_us", to: "welcome#contact_us")

  # POST "/process_contact"
  post("/process_contact", to: "welcome#process_contact")



end
