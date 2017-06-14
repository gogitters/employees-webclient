class EmployeesController < ApplicationController
  URL = "http://localhost:3001/api/v1/employees"
  HEADER = { "Accept" => "application/json", "X-User-Email" => "sami@gmail.com", "Authorization" => "Token token=purple_hippo" }
  def index
    @employees = Employee.all
    render :index
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    employee = Employee.create(first_name: params[:first_name],
                               last_name: params[:last_name],
                               email: params[:email])
    redirect_to "/employees/#{employee.id}"
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
    render :edit
  end

  def update
    employee = Employee.find_by(id: params[:id])
    employee.update(first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email])
    redirect_to "/employees/#{employee.id}"
  end

  def destroy
    employee = Employee.find_by(id: params[:id])
    employee.destroy
    redirect_to "/employees"
  end
end
