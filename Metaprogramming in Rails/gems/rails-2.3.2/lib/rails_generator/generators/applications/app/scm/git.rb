#---
# Excerpted from "Metaprogramming Ruby: Program Like the Ruby Pros",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr for more book information.
#---
module Rails
  class Git < Scm
    def self.clone(repos, branch=nil)
      `git clone #{repos}`

      if branch
        `cd #{repos.split('/').last}/`
        `git checkout #{branch}`
      end
    end

    def self.run(command)
      `git #{command}`
    end
  end
end