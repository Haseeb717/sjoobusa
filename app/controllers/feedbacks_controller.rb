class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_company!

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.where(company_id: current_company.id)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    @feedback.company_id = current_company.id
    @feedback.employee_id = params[:employee_id]

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to employee_feedback_path(employee_id: @feedback.employee_id, id: @feedback.id), notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(
        :company_id,
        :employee_id,
        :service_type,
        :role,
        :start_at,
        :end_at,
        :termination_reason,
        :productivity_score,
        :commitment_score,
        :excellence_score,
        :leadership_score,
        :proactivity_score,
        :teamwork_score,
        :flexibility_score,
        :contribution_to_sales,
        :unjustified_absences,
        :warnings,
        :late_for_work,
        :contribution_to_sales_do_not_apply
      )
    end
end
