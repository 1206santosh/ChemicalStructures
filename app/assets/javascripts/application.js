// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//=require  jquery
//= require rails-ujs
//= require bootstrap/dist/js/bootstrap
//= require dataTables.min
//= require activestorage
//= require chemical_structures





$('document').ready(function(){
    var opts = {
        lines: 13, // The number of lines to draw
        length: 38, // The length of each line
        width: 17, // The line thickness
        radius: 45, // The radius of the inner circle
        scale: 1, // Scales overall size of the spinner
        corners: 1, // Corner roundness (0..1)
        color: '#ffffff', // CSS color or array of colors
        fadeColor: 'transparent', // CSS color or array of colors
        speed: 1, // Rounds per second
        rotate: 0, // The rotation offset
        animation: 'spinner-line-fade-quick', // The CSS animation name for the lines
        direction: 1, // 1: clockwise, -1: counterclockwise
        zIndex: 2e9, // The z-index (defaults to 2000000000)
        className: 'spinner', // The CSS class to assign to the spinner
        top: '50%', // Top position relative to parent
        left: '50%', // Left position relative to parent
        shadow: '0 0 1px transparent', // Box-shadow for the lines
        position: 'absolute' // Element positioning
    };
    setTimeout(
        function () {
            marvin.sketcherInstance = new marvin.Sketch("sketch")
            marvin.sketcherInstance.setServices(getDefaultServices())
            if (gon.marvin_structure != undefined || gon.marvin_structure == "") {
                console.log(gon.marvin_structure)
                marvin.sketcherInstance.importAsMrv(gon.marvin_structure);
            }
            $($($(".mjs-toolbar")[1]).find('tr')[0]).append('<a class="btn btn-info" data-toggle="modal" data-target="#name-modal">Edit Name</a>')
            $($($(".mjs-toolbar")[1]).find('tr')[0]).append('<a class="btn btn-success save_form pull-right">Save Changes</a>')
            $(".save_form").css('position', 'absolute')
            $(".save_form").css('left', '88%')
        }
        , 1000)
})