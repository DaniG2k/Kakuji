class TutorsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_tutor, except: :create
  before_action :parse_geolocation, only: :update
  helper_method :sort_column, :sort_direction
  
  def index
    @tutors = Tutor.all.includes(:user).order(sort_column + " " + sort_direction).page(params[:page]).per(15)
  end
  
  def new
    @tutor = current_user.build_tutor unless @tutor
    @tutor.educational_experiences.build
    @tutor.languages.build
  end
  
  def create
    @tutor = current_user.build_tutor(tutor_params)
    if @tutor.save
      set_user_is_tutor
      flash[:success] = 'Tutor profile created!'
      redirect_to @tutor
    else
      render 'new'
    end
  end

  def show
    @educational_experiences = @tutor.educational_experiences
    @languages = @tutor.languages
  end
  
  def edit
    @tutor.educational_experiences.build
    @tutor.languages.build
  end
  
  def update    
    if @tutor.update_attributes(tutor_params)
      set_user_is_tutor
      flash[:success] = 'Tutor profile updated!'
      redirect_to @tutor
    else
      render 'edit'
    end
  end
  
  def destroy
    @tutor.destroy
    current_user.update_attribute(:is_tutor, false)
    redirect_to tutors_path
  end
  
  private
    def tutor_params
      params.require(:tutor).permit(:id, :description, :rate,
        :country, :city, :postalcode, :street, :address,
        languages_attributes: [:id, :language, :proficiency, :_destroy],
        educational_experiences_attributes:
        [:id, :university, :major, :minor, :_destroy]
      )
    end
    
    def get_tutor
      @tutor = current_user.tutor
    end
    
    def sort_column
      %w(rate country).include?(params[:sort]) ? params[:sort] : "rate"
    end
    
    def sort_direction
      %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    def set_user_is_tutor
      unless current_user.is_tutor?
        current_user.update_attribute(:is_tutor, true)
      end
    end
    
    def parse_geolocation
      country = params[:tutor][:country].downcase
      city = params[:tutor][:city].downcase
      postalcode = params[:tutor][:postalcode].downcase
      street = params[:tutor][:street].downcase
      
      address = Array.new
      [street, postalcode, city, country].each {|attr| address << attr.humanize if attr.present?}
      address = address.join(', ')
      params[:tutor][:address] = address
    end
end