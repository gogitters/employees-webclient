class EmployeesController < ApplicationController
  URL = "http://localhost:3001/api/v1/employees"
  HEADER = { "Accept" => "application/json" }
  def index
    @employees = Unirest.get("#{URL}.json").body
    render :index
  end

  def show
    @employee = Unirest.get("#{URL}/#{params[:id]}.json").body
    render :show
  end

  def new
    render :new
  end

  def create
    employee = Unirest.post("#{URL}.json", headers: HEADER,
         parameters: { first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email] }
                      ).body
    if employee["errors"]
      flash[:warning] = employee["errors"]
      redirect_to "/employees/new"
    else
      redirect_to "/employees/#{employee['id']}"
    end
  end

  def edit
    @employee = Unirest.get("#{URL}/#{params[:id]}.json").body
    render :edit
  end

  def update
    employee = Unirest.patch("#{URL}/#{params[:id]}.json", headers: HEADER,
         parameters: { first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email] }).body
    redirect_to "/employees/#{employee['id']}"
  end

  def destroy
    employee = Unirest.delete("#{URL}/#{params[:id]}.json", headers: HEADER).body
    flash[:success] = employee["message"]
    redirect_to "/employees"
  end
end
