class LeaveRequestsController < ApplicationController
  before_action :find_employee_leave_request, only: %i[show edit update destroy]
  before_action :all_employees, only: %i[new edit]
  before_action :authenticate_user!

  def index
    @leave_request = LeaveRequest.all
  end

  def show; end

  def new
    @leave_request = LeaveRequest.new
  end

  def create
    @leave_request = LeaveRequest.new(leave_params)
    if @leave_request.save
      flash[:notice] = 'Leave request was sucessfully created'
      redirect_to leave_requests_path
    else
      render :new
    end
  end

  def edit

  end
   

  def update
    if @leave_request.update(leave_params)
      redirect_to leave_requests_path, notice: 'Leave request was sucessfully created'

    else
      render :edit
    end
  end

  def destroy
    @leave_request.destroy
    redirect_to leave_requests_path
  end

  def update_status
    leave_request = LeaveRequest.find(params['format'].to_i)
    if params[:commit] == 'Approve'
      leave_request.update(status: 'approved')
    else
      leave_request.update(status: 'rejected')
    end
    redirect_to leave_requests_path
  end
  

  private

  def all_employees
    @employees = Employee.all
  end

  def find_employee_leave_request
    @leave_request = LeaveRequest.find(params[:id])
  end

  def leave_params
    params.require(:leave_request).permit(:start_date, :end_date, :leave_type, :status, :employee_id)
  end
end
