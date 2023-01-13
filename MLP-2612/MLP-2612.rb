def remove_active_lab_appointment
    lab_appt = LaboratoryAppointment.find_by(cust_appointment_id: params[:cust_appointment_id])
    
end
