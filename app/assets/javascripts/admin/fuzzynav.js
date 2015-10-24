var fzn;

$(document).ready(function() {

  fzn = FuzzySet();
  fzn.add("Images / New");
  fzn.add("Galleries");
  fzn.add("Galleries / New");
  fzn.add("Galleries / Show");
  fzn.add("Galleries / Edit");

  $('#command-input').keyup(function() {
    cmd = fzn.get($(this).val());

    if(cmd != null) {
      $('#command-suggest').text(cmd[0][1]);
    } else {
      $('#command-suggest').text('');
    }
  });

});
