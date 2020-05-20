require 'ctlr_test_helper'

class RegistrationsControllerTest < ActionController::TestCase

  context 'registrations ctrl' do
    setup do
      Tenant.set_current_tenant( tenants( :tenant_1 ).id )
      @controller = Milia::RegistrationsController.new
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    should "get edit with login without flash errors" do
      sign_in( users( :quentin ) )
      get :edit
      assert_response :success
      sign_out( users( :quentin ) )
      assert flash[:error].blank?
    end  # should do

    should 'not get edit without login' do
      get :edit
      # redirects to sign in page
      assert_redirected_to new_user_session_path
    end  # should do

  end  # context

end  # end class test
