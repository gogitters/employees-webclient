class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3001/api/v2/employees.json").body
    render :index
  end

  def show
    @employee = Unirest.get("http://localhost:3001/api/v2/employees.json").body
  end
end
