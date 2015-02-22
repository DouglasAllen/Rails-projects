require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should authenticate using the token" do
    Person.expects(:where).with(token: "token").returns([person = build(:person)])
    assert_equal person, Person.authenticate("token")
  end

  test "returns a persons latest status" do
    person = build(:person)
    person.stubs(:statuses).returns(status_proxy = stub('status proxy'))
    status_proxy.stubs(:order).with("created_at DESC").returns(ordered_proxy = stub('ordered status proxy'))
    ordered_proxy.expects(:first).returns(status = build(:status))
    assert_equal status, person.latest_status
  end

  test "generates a token after creation" do
    # could use an observer to avoid hitting the DB here
    person = build(:person)
    refute person.token.present?
    person.save!
    assert person.token.present?
  end
end
