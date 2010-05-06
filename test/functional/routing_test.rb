require 'test_helper'

class RoutingTest < ActionController::TestCase
  #SESSIONS CONTROLLER ROUTES TESTING
  #
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

  test 'should route to session get' do
    assert_routing( { :method     => 'get',
                      :path       => '/sessions/1'       } ,
                    { :controller => 'sessions',
                      :action     => 'show',
                      :id         => '1'                 } )
  end

  test 'should route to session put' do
    assert_routing( { :method     => 'put',
                      :path       => '/sessions/1'       } ,
                    { :controller => 'sessions',
                      :action     => 'update',
                      :id         => '1'                 } )
  end

  test 'should route to session delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/sessions/1'       } ,
                    { :controller => 'sessions',
                      :action     => 'destroy',
                      :id         => '1'                 } )
  end

  #AUTHORS CONTROLLER ROUTES TESTING
  #
  test 'should route to authors get' do
    assert_routing( { :method     => 'get',
                      :path       => '/authors'         } ,
                    { :controller => 'authors',
                      :action     => 'index'            } )
  end

  test 'should route to authors post' do
    assert_routing( { :method     => 'post',
                      :path       => '/authors'         } ,
                    { :controller => 'authors',
                      :action     => 'create'           } )
  end

  test 'should route to new author get' do
    assert_routing( { :method     => 'get',
                      :path       => '/authors/new'     } ,
                    { :controller => 'authors',
                      :action     => 'new'              } )
  end

  test 'should route to edit author get' do
    assert_routing( { :mehod      => 'get',
                      :path       => '/authors/1/edit'  } ,
                    { :controller => 'authors',
                      :action     => 'edit',
                      :id         => '1'                } )
  end

  test 'should route to author get' do
    assert_routing( { :method     => 'get',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'show',
                      :id         => '1'                } )
  end

  test 'should route to author put' do
    assert_routing( { :method     => 'put',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'update',
                      :id         => '1'                } )
  end

  test 'should route to author delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'destroy',
                      :id         => '1'                } )
  end

  #COMMENTS CONTROLLER ROUTES TESTING
  #
  test 'should route to article comments get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/comments' } ,
                    { :controller => 'comments',
                      :action     => 'index',
                      :article_id => '1'                    } )
  end

  test 'should route to article comments post' do
    assert_routing( { :method     => 'post',
                      :path       => '/articles/1/comments' } ,
                    { :controller => 'comments',
                      :action     => 'create',
                      :article_id => '1'                    } )
  end
=begin
  test 'should route to new article comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/article/1/comments/new'     } ,
                    { :controller => 'authors',
                      :action     => 'new'              } )
  end

  test 'should route to edit author get' do
    assert_routing( { :mehod      => 'get',
                      :path       => '/authors/1/edit'  } ,
                    { :controller => 'authors',
                      :action     => 'edit',
                      :id         => '1'                } )
  end

  test 'should route to author get' do
    assert_routing( { :method     => 'get',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'show',
                      :id         => '1'                } )
  end

  test 'should route to author put' do
    assert_routing( { :method     => 'put',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'update',
                      :id         => '1'                } )
  end

  test 'should route to author delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/authors/1'       } ,
                    { :controller => 'authors',
                      :action     => 'destroy',
                      :id         => '1'                } )
  end
=end
end