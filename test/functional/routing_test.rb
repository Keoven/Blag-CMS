require 'test_helper'

class RoutingTest < ActionController::TestCase
  test 'should route to logout sessions get' do
    assert_routing( { :method     => 'get',
                      :path       => '/sessions/logout'  } ,
                    { :controller => 'sessions',
                      :action     => 'logout'            } )
  end

  test 'should route to sessions get' do
    assert_routing( { :method     => 'get',
                      :path       => '/sessions'         } ,
                    { :controller => 'sessions',
                      :action     => 'index'             } )
  end

  test 'should route to sessions post' do
    assert_routing( { :method     => 'post',
                      :path       => '/sessions'         } ,
                    { :controller => 'sessions',
                      :action     => 'create'            } )
  end

  test 'should route to new session get' do
    assert_routing( { :method     => 'get',
                      :path       => '/sessions/new'     } ,
                    { :controller => 'sessions',
                      :action     => 'new'               } )
  end

  test 'should route to edit session get' do
    assert_routing( { :mehod      => 'get',
                      :path       => '/sessions/1/edit'  } ,
                    { :controller => 'sessions',
                      :action     => 'edit',
                      :id         => '1'                 } )
  end
end