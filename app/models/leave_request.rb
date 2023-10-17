class LeaveRequest < ApplicationRecord
    belongs_to :employee
    enum status: { pending: 0, approved: 1, rejected: 2 }
end