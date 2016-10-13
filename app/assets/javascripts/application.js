// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-migrate-1.2.1.min
//= require jquery-ui-1.10.3.custom.min
//= require bootstrap/js/bootstrap.min
//= require bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min
//= require jquery-slimscroll/jquery.slimscroll.min
//= require jquery.blockui.min
//= require jquery.cookie.min
//= require uniform/jquery.uniform.min
//= require admin/app
//= require list
//= require grayscale
//= require jquery.easing.min
//= require jquery.fancybox
//= require happy
//= require happy.methods
// require turbolinks
//= require jquery.validate
//= require_self


$(document).ready(function () {
    $("#consumidor").validate({
        rules: {
            name: "required",
            identification: "required",
            'birth[(3i)]': {
                required: true
            },
            'birth[(2i)]': {
                required: true
            },
            'birth[(1i)]': {
                required: true
            },
            mobile: {
                required: true,
                maxlength: 13
            },

            email: {
                required: true,
                email: true
            },
            number: {
                required: true
            },
            picture: {
                required: true
            },
            acepto: "required"
        },
        messages: {
            name: "Este campo es requerido",
            identification: "Este campo es requerido",
            'birth[(3i)]': "Seleccione una opción",
            'birth[(2i)]': "Seleccione una opción",
            'birth[(1i)]': "Seleccione una opción",
            email: "Digite un email valido",
            acepto: "Debe aceptar los Términos y Condiciones",
            mobile: {
                required: "Este campo es requerido",
                maxlength: "Maximo 13 digitos"
            },
            number: "Este campo es requerido",
            picture: "Debe subir foto de factura"

        }
    });

    $("#adulto").validate({
        rules: {
            'birth[(3i)]': {
                required: true
            },
            'birth[(2i)]': {
                required: true
            },
            'birth[(1i)]': {
                required: true
            }
        },
        messages: {

            'birth[(3i)]': "Seleccione una opción",
            'birth[(2i)]': "Seleccione una opción",
            'birth[(1i)]': "Seleccione una opción"


        }
    });

});

$ = jQuery.noConflict();