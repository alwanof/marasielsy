
(function($) {
    "use strict"; // Start of use strict
    // Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
            // Prevent default anchor click behavior
            /*event.preventDefault();*/

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function(){

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });
        } // End if
    });

    $(window).scroll(function() {
        $(".slideanim").each(function(){
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
            if (pos < winTop + 600) {
                $(this).addClass("slide");
            }
        });
    });



    // Collapse Navbar
    var navbarCollapse = function() {
        if ($("#mainNav").offset().top > 100) {
            $("#mainNav").css({'top':'0'});
            $("#mainNav").addClass("navbar-shrink");
            if($("#mainNav").css("background-color")!="rgb(255, 255, 255)"){
                $("#logo").attr('src',site_url+'/front/img/logo-w.png');
            }

            $("#driver").addClass('btn-secondary');
            $("#driver").removeClass("btn-primary");
        } else {
            $("#mainNav").css({'top':'40px'});
            $("#mainNav").removeClass("navbar-shrink");
            $("#driver").addClass('btn-primary');
            $("#driver").removeClass("btn-secondary");
            $("#logo").attr('src',site_url+'/front/img/logo.png');
        }
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);

})(jQuery); // End of use strict
