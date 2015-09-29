$(document).on("ready page:load", function() {
  if($('ul.accordion-nav')) {
    
    // Add Accordion Feature
    $('ul.accordion-nav li a').click(function() {
      // Collapse All
      $('ul.accordion-nav li').each(function() {
        $(this).children('ul').slideUp(200);
        $(this).children('a').children('.collapse-icon').removeClass('fa-chevron-down').addClass('fa-chevron-right');
      });

      // Expand or collapse current
      $(this).siblings('ul').slideDown(200);
      $(this).children('.collapse-icon').toggleClass('fa-chevron-down').toggleClass('fa-chevron-right');
    });
  }
});
