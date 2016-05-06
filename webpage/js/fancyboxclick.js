/**
 * Created by victoria_G on 5/6/16.
 */
$(function($){
    var addToAll = false;
    var gallery = false;
    var titlePosition = 'inside';
    $(addToAll ? 'img' : 'img.fancybox').each(function(){
        var $this = $(this);
        var title = $this.attr('title');
        var src = $this.attr('data-big') || $this.attr('src');
        var a = $('<a href="#" class="fancybox"></a>').attr('href', src).attr('title', title);
        $this.wrap(a);
    });
    $('a.fancybox').fancybox({
        titlePosition: titlePosition,
        scrolling:"no",
        centerOnScroll:false,
        'transitionIn'      : 'fade',
        'transitionOut'     : 'fade'
    });

    $('#wordMap').fancybox({
        centerOnScroll:false,
        scrolling:"no",
        'width':525,
        'height':525,
        'title':"Zoom in or out on the map by clicking on the + or -, or double clicking, or scrolling. Click and drag to explore the less frequently used words.",
        'autoSize' : false
    })
});

$.fancybox.center = function(duration){
    // noop;
}

$.noConflict();
