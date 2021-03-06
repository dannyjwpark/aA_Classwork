module ApplicationHelper
    def auth_token
        "<input
        type='hidden'
        name='authenticity_token'
        value='#{form_authenticity_token}'
        />".html_safe 
    end

    def highlight(text)
        "<strong class=\"highlight\">#{h(text)}</strong>".html_safe
    end

    def picture_for(user)
        html = '<div class="user-picture">'
        html += "<img src=\"#{user.picture_url}\" alt=\"#{h(user.name)}\">"
        html += '</div>'

        html.html_safe
    end

    def ugly_lyrics(lyrics)
    formatted_lyrics = ""
    lyrics.lines.each do |line|
      formatted_lyrics << "&#9835; #{h(line)}"
    end

    "<pre class='lyrics'>#{formatted_lyrics}</pre>".html_safe
    end

end
