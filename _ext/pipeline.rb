require 'downloads'
require 'format_helper'

Awestruct::Extensions::Pipeline.new do

  ## News related extensions
  #extension Awestruct::Extensions::Posts.new( '/news' )
  #extension Awestruct::Extensions::Atomizer.new(:posts, '/news.atom')
  #extension Awestruct::Extensions::Paginator.new(:posts, '/news/index', :per_page => 5)
  #extension Awestruct::Extensions::Disqus.new
  #
  ## Convert root files to <dir_name>/index.html
  #extension Awestruct::Extensions::Indexifier.new

  extension Downloads.new()

  extension Awestruct::Extensions::Posts.new( '/news' )
  extension Awestruct::Extensions::Atomizer.new( :posts, '/news.atom' )
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Disqus.new
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Paginator.new( :posts, '/news/index',
                                                  :per_page=>3 )

  helper FormatHelper

end

