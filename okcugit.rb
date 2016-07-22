require 'pry'

module OkCuGit
  class Finder
    def find_author_from_commit(raw_commit)
      author_line = raw_commit.lines[1]

      name = author_line[8..-1].split("<")[0].strip
      email_address = author_line[8..-1].split("<")[1][0..-3]

      "\"#{name}\" <#{email_address}>"
    end

    def find_authors_from_commits(raw_commits)
      individual_commits = raw_commits.split("commit")[1..-1]
      individual_commits.map{|commit| find_author_from_commit(commit) }
    end
  end
end
