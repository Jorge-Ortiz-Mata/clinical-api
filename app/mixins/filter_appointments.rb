module FilterAppointments
  def with_doctors_and_patients
    self.includes(:doctor).includes(:patient)
  end

  def filter_by_from(from)
    return self.where("start_time < ?", Time.current) if from.eql? "past"
    return self.where("start_time > ?", Time.current) if from.eql? "future"

    self
  end

  def apply_pagination(page, length)
    offset = (length.to_i * page.to_i) - length.to_i

    self.offset(offset).limit(length)
  end
end
