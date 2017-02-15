class AdminController < ApplicationController
    http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
    
    def index
      @pending = Person.pending.order(:id)
      @published = Person.published.order(:weight, :id)
    end
  
    def new
    end
    
    def create
      params[:person][:published] = true
      @person = Person.new(person_params)
 
      if @person.save
        flash.now[:notice] = "Updloaded & Published!"
      else
        flash.now[:error] = "Sorry, there was a problem submitting, please let Kat know."
      end
      render :new
    end
    
    private
    def person_params
      params.require(:person).permit(:photo, :name, :trajectory, :age, :occupation, :migration_reason, :value_prop, :story, :location, :weight, :published, :photographer)
    end
  end