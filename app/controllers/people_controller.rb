class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def edit
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
    @person.build_address
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "Person has been saved"
      redirect_to people_url
    else
      flash[:notice] = "Person has left the library."
      render "new"
    end
  end

  def show
    @person = Person.find(params[:id])
    @address = @person.address
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      flash[:notice] = "This person has been updated."
      redirect_to people_url
    else
      flash[:notice] = "I can't do that, Dave."
      render "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url
  end

private

  def person_params
    params.require(:person).permit(
      :first_name, :last_name, :phone,
      address_attributes:
      [:street_address, :city, :state, :zip])
  end
end
