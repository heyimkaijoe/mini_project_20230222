require "test_helper"

class ShortUrlTest < ActiveSupport::TestCase
  setup do
    @short_url = ShortUrl.new(full_url: "https://www.twitch.tv/")
  end

  test "should be valid" do
    assert @short_url.valid?
  end

  test "full url should be present" do
    @short_url.full_url = ""
    assert_not @short_url.valid?
  end

  test "full url should be unique" do
    duplicate_short_url = @short_url.dup
    @short_url.save
    assert_not duplicate_short_url.valid?
  end

  test "code should be 9 characters" do
    @short_url.save
    assert_equal @short_url.code.length, 8
  end
end
