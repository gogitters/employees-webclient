class Employee
  attr_accessor :id, :first_name, :last_name, :email

  HEADER = { "Accept" => "application/json", "X-User-Email" => ENV['EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}" }

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
  end

  def self.all
    api_employees = Unirest.get("#{ENV['URL']}.json", headers: HEADER).body
    array_employees = []
    api_employees.each do |employee|
      array_employees << Employee.new(employee)
    end
    array_employees
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find_by(input)
    hash = Unirest.get("#{ENV['URL']}/#{input[:id]}.json", headers: HEADER).body
    Employee.new(hash)
  end

  def self.create(input)
    employee = Unirest.post("#{ENV['URL']}.json", headers: HEADER,
         parameters: input).body
    Employee.new(employee)
  end

  def update(input)
    employee = Unirest.patch("#{ENV['URL']}/#{self.id}.json", headers: HEADER, parameters: input).body
    Employee.new(employee)
  end

  def destroy
    Unirest.delete("#{ENV['URL']}/#{self.id}.json", headers: HEADER).body
  end
end
