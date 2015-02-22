module GravatarHelper
  def gravatar(person, size, options={})
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(person.email)}?s=#{size}", options.merge(width: size, height: size, class: "gravatar")
  end
end
