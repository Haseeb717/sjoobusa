class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_company!

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  def search
    @employee = Employee.new
  end

  def search_result
    @employees = Employee.where(employee_params)
    @cpf = Cpf.new(employee_params[:cpf])

    unless @cpf.valido?
      redirect_to search_employees_url, notice: 'CPF inválido'
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @can_add_feedback = Feedback.where(employee_id: params[:id], company_id: current_company.id).count == 0

    # TODO: Refactor
    @avg_commitment_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:commitment_score)[1] ||= 0) * 20

    @avg_excellence_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:excellence_score)[1] ||= 0) * 20

    @avg_productivity_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:productivity_score)[1] ||= 0) * 20

    @avg_leadership_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:leadership_score)[1] ||= 0) * 20

    @avg_proactivity_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:proactivity_score)[1] ||= 0) * 20

    @avg_teamwork_score = (Feedback.where(employee_id: params[:id])
                                  .group(:employee_id)
                                  .average(:teamwork_score)[1] ||= 0) * 20

    @avg_flexibility_score = (Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .average(:flexibility_score)[1] ||= 0) * 20
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.cpf = params[:cpf]
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:cpf, :name, :email, :phone, :photo)
    end
end
