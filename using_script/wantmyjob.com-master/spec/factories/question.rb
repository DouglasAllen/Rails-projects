Factory.define :question do |q|
  q.question_type Question::EMPLOYER_QUESTION
  q.text "At <company>, who gets your stapler if you die?"
  q.verified true
  q.completed true
  q.question_answers { (0..3).map { Factory.build(:question_answer) } }
end

Factory.sequence :question_answer do |n|
  "Answer #{n}, it turns out"
end

Factory.define :question_answer do |qa|
  qa.text { Factory.next :question_answer }
end
