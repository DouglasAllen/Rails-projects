require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "returns the most recent status for each person" do
    alice = build(:person)
    alice.stubs(:latest_status).returns(alice_status = build(:status, created_at: 1.hour.ago))
    bob = build(:person)
    bob.stubs(:latest_status).returns(bob_status = build(:status, created_at: 1.minute.ago))
    people = [alice, bob]
    Person.stubs(:all).returns(people)

    assert_equal [bob_status, alice_status], Status.most_recent_by_person
  end

  test "returns statuses ordered by recency" do
    Status.expects(:order).with("created_at DESC").returns(ordered_proxy = stub('ordered statuses'))
    ordered_proxy.expects(:limit).with(100).returns(statuses = stub('statuses'))

    assert_equal statuses, Status.all_by_recency
  end
end
