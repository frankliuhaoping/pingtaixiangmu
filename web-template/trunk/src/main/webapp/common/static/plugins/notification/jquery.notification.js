/*操作提示*/
var Public = Public || {};
Public.tips = function(content, type, options){ return new Public.Tips(content, type, options); }
Public.Tips = function(content, type, options){
    var defaults = {
        description : '',
        autoClose : true,
        onClose : null,
        onShow : null
    }
    this.options = $.extend({},defaults,options);
    this.options.content = content;
    this.options.type = type || 'info';
    this._init();

    !Public.Tips._collection ?  Public.Tips._collection = [this] : Public.Tips._collection.push(this);
}

Public.Tips.removeAll = function(){
    try {
        for(var i=Public.Tips._collection.length-1; i>=0; i--){
            Public.Tips._collection[i].remove();
        }
    }catch(e){}
}

Public.Tips.prototype = {
    _init : function(){
        var self = this,opts = this.options,time;
        Public.Tips.removeAll();

        this._create();

        if(opts.autoClose){
            time = opts.type == 'error' || opts.type == 'warning' ? 5000 : 3000;
            window.setTimeout(function(){
                self.remove();
            },time);
        }
    },

    _create : function(){
        var opts = this.options, self = this;

        var msgclass = 'tau-system-message-success'; // default success message will shown
        if(opts.type == 'error'){
            msgclass = 'tau-system-message-error'; // over write the message to error message
        } else if(opts.type == 'info'){
            msgclass = 'tau-system-message-information'; // over write the message to information message
        } else if(opts.type == 'warning'){
            msgclass = 'tau-system-message-warning'; // over write the message to warning message
        }

        // Parent Div container
        var container = '<div id="tau-system-message_notifyBar" class="tau-system-message '+msgclass+ '">';

        container += '<div class="tau-system-message-body"><div class="tau-img"></div>';
        container += '<div class="tau-txt"><h3>' + opts.content + '</h3>';
        if(opts.description != ''){
            container += '<p>' + opts.description + '</p>';
        }
        container += '</div><div class="tau-system-message-button" style="display: block;"><div class="tau-btn"></div></div></div></div>';

        this.obj = $(container);
        this.closeBtn = this.obj.find('.tau-btn');
        this.closeBtn.bind('click',function(){
            self.remove();
        });

        // Appeding notification to Body
        $('body').append(this.obj);

        var txtWidth = $('.tau-txt').outerWidth(true);
        var imgWidth = $('.tau-img').outerWidth(true);
        var btnWidth = $('.tau-system-message-button').outerWidth(true);
        $('div#tau-system-message_notifyBar').css('width', txtWidth + imgWidth + btnWidth + 22);

        var divHeight = $('div#tau-system-message_notifyBar').height();
        // see CSS top to minus of div height
        $('div#tau-system-message_notifyBar').css({
            top : '-'+divHeight+'px'
        });

        // showing notification message, default it will be hidden
        $('div#tau-system-message_notifyBar').show();

        // Slide Down notification message after startAfter seconds
        $('div#tau-system-message_notifyBar').animate({
            top: 0
        });

        if(opts.onShow){
            opts.onShow();
        }
    },

    remove : function(){
        var opts = this.options;
        this.obj.fadeOut(200,function(){
            $(this).remove();
            if(opts.onClose){
                opts.onClose();
            }
        });
    }
};