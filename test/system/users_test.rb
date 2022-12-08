require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    sleep(1)
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url

    sleep(1)
    click_on "New user"

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "User name", with: @user.user_name
    sleep(1)
    click_on "Create User"

    assert_text "User was successfully created"
    sleep(1)
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    sleep(1)
    click_on "Edit this user", match: :first

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "User name", with: @user.user_name
    sleep(1)
    click_on "Update User"

    sleep(1)
    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    sleep(1)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
