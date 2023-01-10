def eligibility_check
    if params[:user_id].nil?
      message = "Missing user id"
    elsif !User.exists?(params[:user_id])
        message = "User with this id doesn't exist."
    else
        user = User.find(params[:user_id])
        appointment_review_processor = AppointmentReviewProcessor.new
        appointment_review_processor.process_for_patient(user)
        message = "Eligiblitity successfully checked for #{user.username}"
    end
    render json: {message: message} 
  end

  def appointment_review_processor
    user = User.find_by_id(params[:user_id])
    if user.nil?
      message = "User not found."
    else
        appointment_review_processor = AppointmentReviewProcessor.new
        appointment_review_processor.process_for_patient(user)
        message = "Appointment review processor successfully run for #{user.username}."
    end
    render json: {message: message} 
  end