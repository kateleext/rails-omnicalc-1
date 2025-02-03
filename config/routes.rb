Rails.application.routes.draw do
  get("/", {:controller => "calculator", :action => "home"})
  get("/:operation/new", {:controller => "calculator", :action => "new"})
  get("/:operation/results",{:controller => "calculator", :action => "results"})
end
