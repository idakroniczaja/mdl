def remove_active_lab_appointment
    lab_appt = LaboratoryAppointment.find_by(cust_appointment_id: params[:cust_appointment_id])
    if lab_appt.exists? 
        lab_appt.delete 
        message = "Lab appointment is successfully deleted?"
    else
        message = "No lab appt related to this appointment"
    end
    render json: {message: message} 
    
end
