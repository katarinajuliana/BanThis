class PeopleController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], only: [:edit, :update, :publish, :destroy]
  
  def index
    @people = Person.published.order(:weight, :id)
  end
  
  def show
    people   = Person.published.order(:weight, :id)
    @person  = Person.find(params[:id])
    person_i = people.index(@person)
    @prev    = people[person_i - 1] if person_i > 0
    @next    = people[person_i + 1] if person_i < people.length
  end
  
  def new
  end
  
  def edit
    @person = Person.find(params[:id])
  end
    
  def create
    params[:person][:published] = false
    @person = Person.new(person_params)
 
    if @person.save
      flash.now[:notice] = "Thank you for your submission!"
    else
      flash.now[:error] = "Sorry, there was a problem submitting your info. Please email your submission to banthisthecampaign@gmail.com"
    end
    render :new
  end
  
  def update
    @person = Person.find(params[:id])
 
    if @person.update(person_params)
      redirect_to admin_index_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to admin_index_path
  end
  
  def publish
    @person = Person.find(params[:person_id])
    @person.published = true
    @person.save
    redirect_to admin_index_path
  end
  
  private
  def person_params
    params.require(:person).permit(:photo, :name, :trajectory, :age, :occupation, :migration_reason, :value_prop, :story, :location, :weight, :published, :email, :photographer)
  end
end
