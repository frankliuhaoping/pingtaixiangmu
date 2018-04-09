/**
 * 头像上传
 */
function initPhotoUploader(uploadUrl, uploadSwf, options) {
	var singleSizeLimit = options.fileSingleSizeLimit ? options.fileSingleSizeLimit : 200 * 1024; // 默认200 K
	var $list = $('.portrait'),
    // 优化retina, 在retina下这个值是2
    ratio = window.devicePixelRatio || 1,

    // 缩略图大小
    thumbnailWidth = 110 * ratio,
    thumbnailHeight = 135 * ratio,

    // Web Uploader实例
    uploader;

	// 初始化Web Uploader
	uploader = WebUploader.create({
	
	    // 自动上传。
	    auto: true,
	
	    // swf文件路径
	    swf: uploadSwf,
	
	    // 文件接收服务端。
	    server: uploadUrl,
	
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: { id: '#filePicker', multiple: false },
	
	    // 只允许选择文件，可选。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png,ico',
	        mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png,image/x-icon'
	    },
	    compress: false,
		fileSingleSizeLimit: singleSizeLimit
	});
	
	// 当有文件添加进来的时候
	uploader.on( 'fileQueued', function( file ) {
		var fileItem = $list.find('.thumbnail');
		var fileItemClass = fileItem.attr('class');
		if(fileItem[0].id) {
			uploader.removeFile(fileItem[0].id, true);
		}
		fileItem.remove();
			
		var $li = $(
				'<div id="' + file.id + '" class="' + fileItemClass + '">' +
				'<img title="' + file.name + '">' +
				'<div class="info">' + file.name + '</div>' +
				'</div>'
			), $img = $li.find('img');
		$('#filePicker').before( $li );
		
	    // 创建缩略图
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
	
	        $img.attr( 'src', src );
	    }, thumbnailWidth, thumbnailHeight );
	});
	
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress span');
	
	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<p class="progress"><span></span></p>')
	                .appendTo( $li )
	                .find('span');
	    }
	
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file, response ) {
	    $( '#'+file.id ).addClass('upload-state-done');
	    if(options) {
	    	options.uploadSuccess(file, response);
	    }
	});
	
	// 文件上传失败，现实上传出错。
	uploader.on( 'uploadError', function( file ) {
	    var $li = $( '#'+file.id ),
	        $error = $li.find('div.error');
	
	    // 避免重复创建
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }
	
	    $error.text('上传失败');
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').remove();
	});
	
	uploader.onError = function( code ) {
		var errorText = '';
		switch( code ) {
			case 'F_DUPLICATE':
				errorText = '请不要选择重复的文件';
				break;
			/*case 'Q_EXCEED_NUM_LIMIT':
				errorText = '您选择的文件数量超限';
				break;*/
			case 'F_EXCEED_SIZE':
				errorText = '您选择的文件大小超出' + WebUploader.formatSize(singleSizeLimit, 0);
				break;
			case 'Q_EXCEED_SIZE_LIMIT':
				errorText = '您选择的文件总大小超限';
				break;
			case 'Q_TYPE_DENIED':
				errorText = '您选择的文件类型不满足';
				break;
		}
		if(errorText != '') {
			Layer.msg(errorText, 'warning');
		}
	};
	
	return uploader;
}