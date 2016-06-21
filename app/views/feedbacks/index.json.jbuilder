json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :company_id, :employee_id, :service_type, :role, :start_at, :end_at, :commitment_score, :excellence_score, :productivity_score, :leadership_score, :proactivity_score, :teamwork_score, :flexibility_score, :contribution_to_sales, :unjustified_absences, :warnings, :late_for_work
  json.url feedback_url(feedback, format: :json)
end
