$(document).on("ready page:load", function() {
  if($('ul.accordion-nav')) {
    
    // Add Accordion Feature
    $('ul.accordion-nav li a').click(function() {
      $(this).siblings('ul').toggle(200);
      $(this).children('.collapse-icon').toggleClass('fa-chevron-down').toggleClass('fa-chevron-right');
    });
  }
});
