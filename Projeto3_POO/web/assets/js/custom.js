/* Nav Change */
$(window).scroll(function() {
  var scroll = $(window).scrollTop();

  if (scroll >= 80) {
    $(".navbar-brand img").removeClass("img-brand");
    $(".navbar-brand img").addClass("new-brand");

    $("nav").removeClass("transparent");
    $("nav").addClass("nav-flat");
    $("nav").addClass("fixed-top");

  } else {
    $(".navbar-brand img").removeClass("new-brand");
    $(".navbar-brand img").addClass("img-brand");

    $("nav").removeClass("nav-flat");
    $("nav").addClass("transparent");
    $("nav").removeClass("fixed-top");
  }
});


/* Search Table */
$(document).ready(function() {
  $('#search-cliente').keyup(function() {
    searchCliente($(this).val());
  });
  function searchCliente(value) {
    $('#table-cliente tbody tr').each(function() {
      var found = 'false';
      $(this).each(function() {
        if ($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
        {
          found = 'true';
        }
      });
      if (found === 'true')
      {
        $(this).show();
      } else
      {
        $(this).hide();
      }
    });
  }
});

$(document).ready(function() {
  $('#search-fornecedor').keyup(function() {
    searchFornecedor($(this).val());
  });
  function searchFornecedor(value) {
    $('#table-fornecedor tbody tr').each(function() {
      var found = 'false';
      $(this).each(function() {
        if ($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
        {
          found = 'true';
        }
      });
      if (found === 'true')
      {
        $(this).show();
      } else
      {
        $(this).hide();
      }
    });
  }
});

var app = angular.module('countCliente', []);
app.controller('counterCliente', function($scope) {
  $scope.cliente = document.getElementById("cCount").innerHTML;
});

var app = angular.module('countFornecedor', []);
app.controller('counterFornecedor', function($scope) {
  $scope.fornecedor = document.getElementById("fCount").innerHTML;
});

/* Jquery Mask */
$(document).ready(function() {
  $('.data').mask('00/00/0000');
  $('.cep').mask('00000-000');
  $('.telefone').mask('(00) 0000-00000');
  $('.cpf').mask('000.000.000-00', {reverse: true});
  $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
  $('.rg').mask('00.000.000-0', {reverse: true});
});
