// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require magicsuggest
//= require_tree .


$(document).on('ready', function()
{
    $("#skills_input").magicSuggest({
        autoSelect: true,
        maxSelection: null,
        hideTrigger: true,
        highlight: false,
        cls: 'form-control-addition',
        selectionCls: 'selection-addition',

        method: 'get',
        data: '/skills.json',        
        valueField: 'name',
        displayField: 'name',

        placeholder: 'Укажите навыки',
        noSuggestionText: 'Совпадений нет'
    });    
});
