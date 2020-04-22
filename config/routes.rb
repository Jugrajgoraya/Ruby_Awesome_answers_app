Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Inside of this is where we define what resources we want available to users
  
  # VERB     PATH       CONTROLLER    PUBLIC METHOD
  # 👇          👇            👇         👇
  get("/hello_world", to: "welcome#hello_world") # when someone visits GET "/hello_world" they are sent to the welcome controller, hello_world action.

  get("/questions", to: "questions#index")

  get("/questions/new", to: "questions#new", as: :new_question)

  post("/questions", to: "questions#create")

  get("/questions/:id", to: "questions#show", as: :question)

  delete("questions/:id", to: "questions#destroy")

  get("/questions/:id/edit", to: "questions#edit", as: :edit_question)

  patch("/questions/:id", to: "questions#update")

  # GET "/" WelcomeController.root method gets called
  get("/", to: "welcome#root")

  # GET "/contact_us"
  get("/contact_us", to: "welcome#contact_us")

  # POST "/process_contact"
  post("/process_contact", to: "welcome#process_contact")



end
