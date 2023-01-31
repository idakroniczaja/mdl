def remove_active_lab_appointment
    if lab_appt.exists? 
        LaboratoryAppointment.find(cust_appointment_id: params[:cust_appointment_id]).destroy 
        message = "Lab appointment is successfully deleted"
    else
        message = "No lab appt related to this appointment"
    end
    render json: {message: message} 
end
