# non-AR model to support serializing a student and lesson_part together
# this is used in the API to show the progress of a student
class ProgressOfStudent < ActiveModelSerializers::Model
  attr_accessor :id, :lesson_part, :student

  # generate the 'unique' id by joining the unique id's of the two wrapped
  # models
  def id
    @id ||= "#{student.id}-#{lesson_part.id}"
  end
end
