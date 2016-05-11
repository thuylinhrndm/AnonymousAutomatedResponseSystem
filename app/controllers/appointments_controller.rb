class AppointmentsController < ApplicationController
  # include CurrentUser
  before_action :set_current_user
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
 
  
  respond_to :html

  def my_clients
    @appointments = Appointment.where('consultant_id = ?', current_user.id).where('time >= ?', Time.now).order(time: :asc)
    
  end
  
  def my_appointments
     @appointments  = Appointment.where(user_id: current_user.id).where('time >= ?', Time.now).order(time: :asc)
  end

  def index
    @appointments = Appointment.where('time >= ?', Time.now).order(time: :asc)
    respond_with(@appointments)
    if @appointments.length == 0
      flash[:alert] = "You have no appointments. Create one now to get started."
    end
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    @appointments = Appointment.where('time > ?', Time.now).order(time: :asc)
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
    respond_with(@appointment)
    else
    redirect_to new_appointment_path(params[@consultant_id]), notice: "that time is already taken"
    end
  end

  def update
    @appointment.update(appointment_params)
    respond_with(@appointment)
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:name, :email, :time, :user_id, :consultant_id)
    end
end
