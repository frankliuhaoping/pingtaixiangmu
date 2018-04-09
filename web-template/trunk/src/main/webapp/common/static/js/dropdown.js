/**
 * 下拉层
 */
var Public = Public || {};
Public.dropdown = function(target, htmlContent, options){
	return new Public.Dropdown(target, htmlContent, options);
}
Public.Dropdown = function(target, htmlContent, options){
	if(target == undefined || target == null) {
		throw new Error('target parameter is required');
	}
	if(target.attr('id') == '') {
		throw new Error('the id attribute of target is required');
	}
    var defaults = {
    	onShow : null
    }
    this.target = target;
    this.targetId = target.attr('id');
    this.content = htmlContent;
    this.options = $.extend({}, defaults, options);
    this._create();
}

Public.Dropdown.onBodyDown = function(event) {
	var edata = event.data;
	if (!(event.target.id == edata.tar.attr('id') || event.target.id == edata.self.id || $(event.target).parents("#"+edata.self.id).length > 0)) {
		edata.self.hide();
	}
}

Public.Dropdown.prototype = {
    _create : function(){
        var tar = this.target, opts = this.options, self = this, id = this.targetId + '_dropdown';
        
        // Parent Div container
        var container = '<div id="'+id+'" style="display:none; position:absolute;" class="">'+this.content+'</div>';
        this.id = id;
        this.container = $(container);

        // Appending to Body
        if($('body:has(#' + id + ')').length == 0){
        	$('body').append(this.container);
        } else {
        	this.container = $('#' + id);
        }
        var targetBorder = tar.css('border');
        var css = {
    		"border": targetBorder,
	    	"background-color": "#ffffff",
	    	"min-height": "200px",
	    	"max-height": "400px",
	    	"overflow-y": "auto",
	    	"overflow-x": "auto",
	    	"z-index": 9999
		};
        var width = tar.outerWidth();
        var offset = tar.offset();
        // set CSS
        this.container.css(css);
        this.container.css({
        	width: width,
            left: offset.left,
            top: offset.top + tar.outerHeight() + 1
        });
        
        if(opts.onShow){
        	opts.onShow();
        }

        // Slide Down, default it will be hidden
        this.container.slideDown("fast");
        
        $("body").bind("mousedown", {tar:tar, self:self}, Public.Dropdown.onBodyDown);
    },
    
    hide : function(){
    	$("#"+this.id).fadeOut("fast");
    	$("body").unbind("mousedown", Public.Dropdown.onBodyDown);
    },
    
    remove : function(){
        this.container.fadeOut(200, function(){
            $(this).remove();
        });
    }
};