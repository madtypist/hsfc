class Submission < ActiveRecord::Base
    belongs_to :applicant
    belongs_to :form_type
    has_many   :responses
    has_many   :questions, through: :form_type


    accepts_nested_attributes_for :responses

    def self.new_with_responses(form_type_id)
      submission = self.new(form_type_id: form_type_id)
      submission.questions.each do |q|
        submission.responses.build(question_id: q.id)
      end
      submission
    end
end
