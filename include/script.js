<script>
$( document ).ready(function() {
  var cite = ' ';
  var psyteachr = ' <a href="https://psyteachr.github.io/"><img src="images/logos/psyteachr_logo.png" style="height: 31px; color: white;" alt="psyTeachR: Reproducible Research" /></a>';
  var license = ' <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0/" target="blank"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png"></a>';

  $("footer div.row div:eq(1) p").html(
    psyteachr + license + cite
  );
  
  $("#toc").appendTo($("#main-nav"));
  
  var $lang = $("<select id='lang' />")
    .append($('<option>', {value:'en', text:'English'}))  
    .append($('<option>', {value:'pt-br', text:'Português Brasileiro'})) 
    .append($('<option>', {value:'zh-Hant', text:'繁體中文'}))  
    .change(function() {
      var lang = $(this).val();
      $('.translation').hide();
      $('.translation[lang=' + lang + ']').show();
    });
    
  $('#main-nav').prepend("<br><span class='note'>Translations are not available yet for most terms.</span>").prepend($lang);
  
  $lang.change();
  
});
</script>

