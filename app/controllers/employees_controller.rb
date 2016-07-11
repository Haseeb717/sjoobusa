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
    @cpf = Cpf.new(employee_params[:cpf])

    # unless @cpf.valido?
    #   redirect_to search_employees_url, notice: 'CPF inválido'
    # end

    @employees = Employee.where(cpf: @cpf)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @can_add_feedback = Feedback.where(employee_id: params[:id], company_id: current_company.id).count == 0

    # Scores
    @avg_commitment_score = @employee.avg_commitment_score * 20
    @avg_excellence_score = @employee.avg_excellence_score * 20
    @avg_productivity_score = @employee.avg_productivity_score * 20
    @avg_leadership_score = @employee.avg_leadership_score  * 20
    @avg_proactivity_score = @employee.avg_proactivity_score * 20
    @avg_teamwork_score = @employee.avg_teamwork_score * 20
    @avg_flexibility_score = @employee.avg_flexibility_score * 20

    @recommendation_status = Employee.recommendation_status(@employee.recommendation_score)

    # Termination Reasons
    @termination_reasons_grouped = Feedback.where(employee_id: params[:id])
                                    .group(:termination_reason)
                                    .count(:termination_reason)

    # Contribution to Sales
    contribution_to_sales_sum = Feedback.where(employee_id: params[:id])
                                    .group(:employee_id)
                                    .order('sum_contribution_to_sales DESC')
                                    .sum(:contribution_to_sales)
    @contribution_to_sales_sum = (contribution_to_sales_sum.count > 0) ? contribution_to_sales_sum[params[:id].to_i] : 0
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
      params.require(:employee).permit(:cpf, :name, :email, :phone)
    end
end
