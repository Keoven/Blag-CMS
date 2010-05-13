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
    assert_routing( { :method      => 'get',
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
  
  test 'should recognize login' do
    assert_recognizes( { :controller => 'sessions',
                         :action     => 'new'          },
                         '/login'                         )
  end
  
  test 'should recognize logout' do
    assert_recognizes( { :controller => 'sessions',
                         :action     => 'logout'        },
                         '/logout'                         )
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
    assert_routing( { :method     => 'get',
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

  test 'should route to new article comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/comments/new' } ,
                    { :controller => 'comments',
                      :action     => 'new',
                      :article_id => '1'                        } )
  end

  test 'should route to edit article comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/comments/1/edit'  } ,
                    { :controller => 'comments',
                      :action     => 'edit',
                      :article_id => '1',
                      :id         => '1'                            } )
  end

  test 'should route to article comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/comments/1'       } ,
                    { :controller => 'comments',
                      :action     => 'show',
                      :article_id => '1',
                      :id         => '1'                            } )
  end

  test 'should route to new comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/comment/new'     } ,
                    { :controller => 'comments',
                      :action     => 'new'               } )
  end

  test 'should route to edit comment get' do
    assert_routing( { :method      => 'get',
                      :path       => '/comment/edit'  } ,
                    { :controller => 'comments',
                      :action     => 'edit'           } )
  end

  test 'should route to destroy by author comment delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/comment/destroy_by_author'       } ,
                    { :controller => 'comments',
                      :action     => 'destroy_by_author'                } )
  end

  test 'should route to comment get' do
    assert_routing( { :method     => 'get',
                      :path       => '/comment'       } ,
                    { :controller => 'comments',
                      :action     => 'show'           } )
  end

  test 'should route to comment put' do
    assert_routing( { :method     => 'put',
                      :path       => '/comment'       } ,
                    { :controller => 'comments',
                      :action     => 'update'         } )
  end

  test 'should route to comment delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/comment'       } ,
                    { :controller => 'comments',
                      :action     => 'destroy'        } )
  end

  #LIKEABLES CONTROLLER ROUTES TESTING
  #
  test 'should route to article likeables get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/likeables' } ,
                    { :controller => 'likeables',
                      :action     => 'index',
                      :article_id => '1'                    } )
  end

  test 'should route to article likeables post' do
    assert_routing( { :method     => 'post',
                      :path       => '/articles/1/likeables' } ,
                    { :controller => 'likeables',
                      :action     => 'create',
                      :article_id => '1'                    } )
  end

  test 'should route to new article likeable get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/likeables/new' } ,
                    { :controller => 'likeables',
                      :action     => 'new',
                      :article_id => '1'                        } )
  end

  test 'should route to edit article likeable get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/likeables/1/edit'  } ,
                    { :controller => 'likeables',
                      :action     => 'edit',
                      :article_id => '1',
                      :id         => '1'                            } )
  end

  test 'should route to article likeable get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1/likeables/1'       } ,
                    { :controller => 'likeables',
                      :action     => 'show',
                      :article_id => '1',
                      :id         => '1'                            } )
  end

  #ARTICLES CONTROLLER ROUTES TESTING
  #
  test 'should route to latest articles' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/latest'   } ,
                    { :controller => 'articles',
                      :action     => 'latest'             } )
  end

  test 'should route to articles get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles'         } ,
                    { :controller => 'articles',
                      :action     => 'index'             } )
  end

  test 'should route to articles post' do
    assert_routing( { :method     => 'post',
                      :path       => '/articles'         } ,
                    { :controller => 'articles',
                      :action     => 'create'            } )
  end

  test 'should route to new article get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/new'     } ,
                    { :controller => 'articles',
                      :action     => 'new'               } )
  end

  test 'should route to edit article get' do
    assert_routing( { :method      => 'get',
                      :path       => '/articles/1/edit'  } ,
                    { :controller => 'articles',
                      :action     => 'edit',
                      :id         => '1'                 } )
  end

  test 'should route to article get' do
    assert_routing( { :method     => 'get',
                      :path       => '/articles/1'       } ,
                    { :controller => 'articles',
                      :action     => 'show',
                      :id         => '1'                 } )
  end

  test 'should route to article put' do
    assert_routing( { :method     => 'put',
                      :path       => '/articles/1'       } ,
                    { :controller => 'articles',
                      :action     => 'update',
                      :id         => '1'                 } )
  end

  test 'should route to article delete' do
    assert_routing( { :method     => 'delete',
                      :path       => '/articles/1'       } ,
                    { :controller => 'articles',
                      :action     => 'destroy',
                      :id         => '1'                 } )
  end

  test 'should recognize root' do
    assert_recognizes( { :controller => 'articles',
                         :action     => 'latest'        },
                         '/'                         )
  end

end