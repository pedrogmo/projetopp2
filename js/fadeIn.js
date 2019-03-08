

$(function(){
    var documentEl = $(document)
    var fadeElem = $('.fade-scroll');

    documentEl.on('scroll', function(){
        var scroll = documentEl.scrollTop();

        fadeElem.each(function(){
            var $this = $(this)
            var elementOffSetTop = $this.offset().top;

            if(scroll > elementOffSetTop)
                $this.css('opacity', 1 - (scroll-elementOffSetTop)/400);
        });
    });
});