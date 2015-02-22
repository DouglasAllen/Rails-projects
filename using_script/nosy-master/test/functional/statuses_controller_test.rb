require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  test "index should refuse unauthenticated connections" do
    get :index

    assert_response :unauthorized
  end

  test "should show most recent statuses" do
    stub_http_auth
    Status.stubs(:most_recent_by_person).returns(statuses = [build(:status)])

    get :index

    assert_equal statuses, assigns[:latest_statuses]
  end

  test "should show older statuses" do
    stub_http_auth
    Status.stubs(:most_recent_by_person).returns(latest_statuses = [build(:status)])
    Status.stubs(:all_by_recency).returns(older_statuses = stub('older statuses'))
    older_statuses.stubs(:-).with(latest_statuses).returns(statuses = [build(:status)])

    get :index

    assert_equal statuses, assigns[:older_statuses]
  end

  test "create should refuse unauthenticated connections" do
    post :create, status: {text: "status-text"}

    assert_response :unauthorized
  end

  test "create should create a status for the logged in person" do
    person = stub('person')
    stub_http_auth(person)
    person.stubs(:statuses).returns(statuses_proxy = stub('statuses proxy'))
    statuses_proxy.expects(:create).with("text" => "status-text")
    CampfireNotifier.stubs(:notify)

    post :create, status: {text: "status-text"}
  end

  test "create should notify campfire" do
    person = stub('person')
    stub_http_auth(person)
    person.stubs(:statuses).returns(statuses_proxy = stub('statuses proxy'))
    statuses_proxy.stubs(:create).with("text" => "status-text").returns(status = build(:status))
    CampfireNotifier.expects(:notify).with(status)

    post :create, status: {text: "status-text"}
  end

  test "create should respond with 200" do
    person = stub('person')
    stub_http_auth(person)
    person.stubs(:statuses).returns(statuses_proxy = stub('statuses proxy'))
    statuses_proxy.stubs(:create).with("text" => "status-text").returns(status = build(:status))
    CampfireNotifier.stubs(:notify)

    post :create, status: {text: "status-text"}

    assert_response :success
  end

  private

  def stub_http_auth(person=stub('person'))
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("anything")
    Person.stubs(:authenticate).returns(person)
  end

end
