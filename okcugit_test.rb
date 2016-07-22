require 'minitest/autorun'
require 'minitest/emoji'
require './okcugit'

class OkCuGitTest < Minitest::Test
  def test_it_exists
    assert OkCuGit::Finder.new
  end

  def test_it_finds_the_author_of_a_single_commit
    log_data = File.read("./sample_single_commit.txt")
    finder = OkCuGit::Finder.new
    author = finder.find_author_from_commit(log_data)
    expected = '"Jeff Casimir" <jeff@casimircreative.com>'
    assert_equal expected, author
  end

  def test_it_finds_the_authors_of_multiple_commits
    log_data = File.read("./sample_multiple_commits.txt")
    finder = OkCuGit::Finder.new
    authors = finder.find_authors_from_commits(log_data)
    expected =
      ['"Casey Ann Cumbow" <cumbow8@gmail.com>',
       '"rrgayhart" <rrgayhart@gmail.com>',
       '"Michael Dao" <michael.dao@gmail.com>',
       '"Andrew Carmer" <carmerandrew@gmail.com>'
      ]
    assert_equal expected, authors
  end
end
