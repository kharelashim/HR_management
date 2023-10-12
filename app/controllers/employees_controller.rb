class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @employee = Employee.all
    end

    def show
      
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee =  Employee.new(employee_params)
        if @employee.save
            flash[:notice] = 'Employee was sucessfully created'
            redirect_to employees_path
        else 
            render :new
        end
    end

    def edit

    end

    def update
        if @employee.update(employee_params)
            redirect_to employees_path, notice: 'Employee was sucessfully updated'
        else
            render :edit
        end
    end

    def destroy
      
        @employee.destroy
        redirect_to employees_path, notice: 'Employee was sucessfully destroyed'
    end

    private 

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :phone_num, :hire_date, :job_title, :department)
    end
end
