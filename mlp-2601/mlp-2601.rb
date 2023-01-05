def add_claim
    if params[:user_id].nil? || params[:cust_appointment_id].nil?      
      message = params[:user_id].nil? ? "User id is missing" : "Appointment id is missing"
    elsif !User.exists?(params[:user_id]) || !CustAppointment.exists?(params[:cust_appointment_id])
      message = !User.exists?(params[:user_id]) ? "User with #{params[:user_id]} doesn't exist" : "Appointment with #{params[:cust_appointment_id]} doesn't exist"
    else
      cust_appointment_date = CustAppointment.find(params[:cust_appointment_id]).start_time
      claim = Payments::Claim.create(user_id:params[:user_id], athena_api_log_id:7199777, cust_appointment_id:params[:cust_appointment_id], patient_balance:33.00, claim_status:"READY_TO_CHARGE_PR", date_of_service: cust_appointment_date.to_date)
      message = "Claim is successfully created for cust appointment #{params[:cust_appointment_id]}"
    end