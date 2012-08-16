function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
function hide_field(link,div) {
  $(div).toggle();
}

function valor(){
    alert('Teste JS interno');
}

$(document).ready(function()
{

//
$("#type_of_2").click(function(){
    $(".envia_individual").hide()
    $(".envia_geral").show()
});
$("#type_of_1").click(function(){
    $(".envia_individual").show()
    $(".envia_geral").hide()
});




$("#inscricao_periodo_opcao2").focusout(function(){
var periodo_opcao2 = $("#inscricao_periodo_opcao2").val(), periodo_opcao1 = $("#inscricao_periodo_opcao1").val();
var opcao1 = $("#inscricao_opcao1").val(), opcao2 = $("#inscricao_opcao2").val()

if ((periodo_opcao2 == periodo_opcao1) && (opcao1 == opcao2))
{
  alert("Selecione Opções diferentes");
  $("#inscricao_opcao2").focus();
}
});
$("#email_confirmation").focusout(function(){   
        if ($("#email").val() == $("#email_confirmation").val())
        {}
        else{
            alert ("As dois emails não conferem, favor corrigir");
            $("#email_confirmation").focus();
    }
});
        //slides the element with class "menu_body" when paragraph with class "menu_head" is clicked
	$("#firstpane p.menu_head").click(function()
    {
		$(this).css({backgroundImage:"url(/stylesheets/images/down.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
       	
	});
});

$(document).ready(function() {

	$('a[name=modal]').click(function(e) {
		e.preventDefault();

		var id = $(this).attr('href');

		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(1000);
		$('#mask').fadeTo("slow",0.8);

		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();

		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);

		$(id).fadeIn(2000);

	});

	$('.window .close').click(function (e) {
		e.preventDefault();

		$('#mask').hide();
		$('.window').hide();
	});

	$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});

});

