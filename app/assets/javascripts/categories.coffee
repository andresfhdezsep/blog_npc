# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
    #console.log($('.pagination'))
    if $('.pagination').length
        $(window).scroll ->
            url = $('.pagination .next_page').attr('href')
            #console.log url
            #console.log $(window).scrollTop()
            if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
                #console.log "Casi llego :D"
                $('.pagination').text("Buscando...")
                $.getScript(url)