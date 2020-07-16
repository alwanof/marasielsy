$(document).ready(function (){

      $(window).on('scroll',function(){
        
        var scroll_top = $(window).scrollTop();

        if(scroll_top > 550)
        {
            $('#about-img-1').slideDown(1000);
            $('#about-img-2').slideDown(2000);
        }

        if(scroll_top > 1300)
        {
           $('#competitiveness-img').fadeIn(800);
        }

        
        if(scroll_top > 2200)
        {
           $('#how-it-work-1').fadeIn(800);
           $('#how-it-work-2').delay(350).fadeIn(900);
           $('#how-it-work-3').delay(450).fadeIn(1000);
        }

        
      });
});