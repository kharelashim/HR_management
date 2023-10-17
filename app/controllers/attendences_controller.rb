class AttendencesController < ApplicationController
  before_action :find_employee_attendence, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @attendence = Attendence.all
  end

  def show; end 

  def new
    @employees = Employee.all
    @attendence = Attendence.new
  end

  def create
    @attendence = Attendence.new(attendence_params)
    if @attendence.save
      flash[:notice] = 'Attendence of employee is created'
      redirect_to attendences_path
    else
      render :new
    end
  end

  def edit
    @employees = Employee.all
    end

  def update
    if @attendence.update(attendence_params)
      redirect_to attendences_path, notice: 'Attendence is sucessfully updated'
    else
      render :edit
    end
  end

  def destroy
    @attendence.destroy
    redirect_to attendence_path, notice: 'Attendence is sucessfully destroyed'
  end

  private

  def find_employee_attendence
    @attendence = Attendence.find(params[:id])
  end

  def attendence_params
    params.require(:attendence).permit(:check_in_time, :check_out_time, :date, :employee_id)
  end
end 
