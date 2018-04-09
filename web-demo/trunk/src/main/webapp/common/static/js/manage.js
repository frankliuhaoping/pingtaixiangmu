var indexLayer =  {};//layer弹出窗口
var ajaxRes = {};//ajax异常错误信息
var ajaxErrorNumber = 0;

//全局的AJAX访问，处理AJAX请求时发生的错误；如session 超时或ajax其他异常
$.ajaxSetup({
    contentType:"application/x-www-form-urlencoded;charset=utf-8",
    complete:function(XMLHttpRequest,textStatus){
        //通过XMLHttpRequest取得响应头，sessionstatus
        var htcfAjaxStatus = XMLHttpRequest.getResponseHeader("htcfAjaxStatus"); 
            if("timeout" == htcfAjaxStatus){//处理shiro session超时
        	    Layer.msg('由于您长时间没有操作，请重新登陆系统！', 'error');
        	    window.setTimeout(function () { 
        		    //跳转的登录页面
	                window.location.href = document.URL.split("/")[0] + "//" + document.URL.split("/")[2] + "/" + document.URL.split("/")[3] + "/index";
        	    }, 3000);
       	    } else if ("exception" == htcfAjaxStatus) {//处理其他ajax请求异常
       	    	ajaxErrorNumber ++;
       	    	ajaxRes[ajaxErrorNumber] = JSON.parse(XMLHttpRequest.responseText);
       		    var html = "<div id='ajaxError' style='position:relative'>";
       		    html += "<img src='"+ document.URL.split("/")[0] + "//" + document.URL.split("/")[2] + "/" + document.URL.split("/")[3] + "/common/static/img/500.png' />";//TODO 地址需要测试
       		    html += "<br/>";
       		    html += "<div class='col-sm-12' style='text-align:center'>";
       		    html += "<h4>" + ajaxRes[ajaxErrorNumber].errMsg + "</h4>";
       		    html += "<button type='button' class='btn btn-primary' onclick='closeAjaxError(" + ajaxErrorNumber + ")'>返回</button>&nbsp;&nbsp;&nbsp;&nbsp;";
       		    html += "<button onclick='showDetail(" + ajaxErrorNumber + ")' style='position:absolute;right:10px;bottom:0;background: none;border: none;color: #aaa;'>错误堆栈</button>";
       		    html += "</div>";
				html += "</div>";
				indexLayer[ajaxErrorNumber] = Layer.openHtml ("系统错误", html, null, ['550px', '400px']);
       	    }
    }
});

function closeAjaxError(indexLayerNumber) {
	layer.close(indexLayer[indexLayerNumber]);
}

function showDetail (detailNumber) {
	var html = "<div>";
	html += ajaxRes[detailNumber].errMsg;
	html += "<br/>";
	html += ajaxRes[detailNumber].errTrace;
	html += "</div>";
	Layer.openHtml ("错误堆栈", html, null, ['830px', '600px']);
}

/**
 * 生成确认操作对话框，包含‘确认’和‘取消’两个按钮，选‘确认’后执行回调函数，选‘取消’只关闭对话框
 * @param title 标题
 * @param content 确认消息
 * @param callback 选‘确认’后的回调函数
 * @returns 模态对话框对象，你可以调用modal('show')来显示
 */
function createConfirmDialog(title, content, callback) {
	var id = 'confirm_modal_' + new Date().getTime();
	var dialog = 
		'<div class="modal fade" id="'+id+'" tabindex="-1" role="dialog">\
			<div class="modal-dialog modal-sm" role="document">\
				<div class="modal-content">\
					<div class="modal-header">\
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">\
							<span aria-hidden="true">&times;</span>\
						</button>\
						<h4 class="modal-title">'+title+'</h4>\
					</div>\
					<div class="modal-body">'+content+'</div>\
					<div class="modal-footer">\
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>\
						<button type="button" class="btn btn-primary" id="determineBtn">确定</button>\
					</div>\
				</div>\
			</div>\
		</div>';
	$('body').append(dialog);
	var dialog = $('#'+id);
	dialog.find('#determineBtn').click(function(){
		if(callback){
			callback();
		}
		dialog.modal('hide');
	});
	dialog.on('hidden.bs.modal', function(){
		dialog.remove();
	});
	//dialog.css('width', '300px');
	//dialog.css('margin', '200px auto');
	return dialog;
}
var REGS = {
    phone: {
        reg: /^((((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?)|(\d{11}))$/,
        desc: "电话或手机号码！"
    },
    mobile: {reg: /^(\d{1,4}\-)?(13|15|18|17){1}\d{9}$/, desc: "手机号码！"}
}

function appendUrlTimestamp(url) {
	if(url.indexOf('_t') == -1) {
		var ts = new Date().getTime();
		if(url.indexOf('?') != -1){
			return url + '&_t=' + ts;
		} else {
			return url + '?_t=' + ts;
		}
	}
	return url;
}
if(!document.resource) document.resource = new Object();

var ManageForm = ManageForm || {};
ManageForm.initForm = function(form, url, options, msgOpts) {
    if(form == undefined || form == null || form == ""){
    	return;
    }
    //ManageForm.clearForm(form);
    form[0].reset();
    options = $.extend({}, options);
    var submitFun = options.submitFun;
    var cancelFun = options.cancelFun;
    var beforeSendFun = options.beforeSendFun;
    var submitBtn = options.submitBtn;
    var cancelBtn = options.cancelBtn;
    document.onkeyup = function (event) {
        e = event ? event : (window.event ? window.event : null);
        if (e.keyCode == 13) {
        	ManageForm.submitForm(form, url, {beforeSendFun:beforeSendFun, submitFun: submitFun}, msgOpts);
        }
    }
    if(submitBtn){
    	submitBtn.click(function () {
    		ManageForm.submitForm(form, url, {beforeSendFun:beforeSendFun, submitFun: submitFun}, msgOpts);
    	});
    }
    if(cancelBtn){
    	cancelBtn.click(function () {
    		cancelFun.call();
    	});
    }
}

// 提交表单请求处理
ManageForm.submitForm = function(form, url, options, msgOpts) {
	if((form == undefined || form == null || form == "") || (url == undefined || url == null || url == "")){
    	return;
    }
	options = $.extend({}, options);
	var url = appendUrlTimestamp(url);
    var submitFun = options.submitFun;
    var beforeSendFun = options.beforeSendFun;
    if (form.valid()) {
    	var flag = true;
    	if(beforeSendFun){
    		flag = beforeSendFun(form);
        }
    	if(flag) {
    		var data = form.serialize();
    		Manage.save(url, data, submitFun, msgOpts);
    	}
    }
}

/**
 * ajax submit form
 */
ManageForm.ajaxSubmit = function (form, options){
	if(form == undefined || form == null || form == ""){
    	return;
    }
	options = $.extend({}, options);
	var param = $.extend({}, options.queryParams);
	if (options.onSubmit.call(form, param) == false){return;}
	form.find('input,select,textarea').blur();
	
	var frameId = 'frame_' + (new Date().getTime());
	var frame = $('<iframe id='+frameId+' name='+frameId+'></iframe>').appendTo('body');
	frame.attr('src', window.ActiveXObject ? 'javascript:false' : 'about:blank');
	frame.css({
		position:'absolute',
		top:-1000,
		left:-1000
	});
	frame.bind('load', callback);
	
	submit(param);
	
	function submit(param){
		if (options.url){
			form.attr('action', options.url);
		}
		var t = form.attr('target'), a = form.attr('action');
		form.attr('target', frameId);
		var paramFields = $();
		try {
			for(var n in param){
				var field = $('<input type="hidden" name="' + n + '">').val(param[n]).appendTo(form);
				paramFields = paramFields.add(field);
			}
			checkState();
			form[0].submit();
		} finally {
			form.attr('action', a);
			t ? form.attr('target', t) : form.removeAttr('target');
			paramFields.remove();
		}
	}
	
	function checkState(){
		var f = $('#'+frameId);
		if (!f.length){return;}
		try{
			var s = f.contents()[0].readyState;
			if (s && s.toLowerCase() == 'uninitialized'){
				setTimeout(checkState, 100);
			}
		} catch(e){
			callback();
		}
	}
	
	var checkCount = 10;
	function callback(){
		var f = $('#'+frameId);
		if (!f.length){return;}
		f.unbind();
		var data = '';
		try{
			var body = f.contents().find('body');
			data = body.html();
			if (data == ''){
				if (--checkCount){
					setTimeout(callback, 100);
					return;
				}
			}
			var ta = body.find('>textarea');
			if (ta.length){
				data = ta.val();
			} else {
				var pre = body.find('>pre');
				if (pre.length){
					data = pre.html();
				}
			}
		} catch(e){
		}
		options.success(data);
		setTimeout(function(){
			f.unbind();
			f.remove();
		}, 100);
	}
}

/**
 * load form data
 * if data is a URL string type load from remote site, 
 * otherwise load from local data object. 
 */
ManageForm.loadForm = function(form, data){
	if (typeof data == 'string'){
		var param = {};
		$.ajax({
			url: data,
			data: param,
			dataType: 'json',
			success: function(data){
				_load(data);
			},
			error: function(){
			}
		});
	} else {
		_load(data);
	}
	
	function _load(data){
		for(var name in data){
			var val = data[name];
			if (!_checkField(name, val)){
				form.find('input[name="'+name+'"]').val(val);
				form.find('textarea[name="'+name+'"]').val(val);
				form.find('select[name="'+name+'"]').val(val);
			}
		}
	}
	
	/**
	 * check the checkbox and radio fields
	 */
	function _checkField(name, val){
		var cc = form.find('input[name="'+name+'"][type=radio], input[name="'+name+'"][type=checkbox]');
		if (cc.length){
			cc._propAttr('checked', false);
			cc.each(function(){
				if (_isChecked($(this).val(), val)){
					$(this)._propAttr('checked', true);
				}
			});
			return true;
		}
		return false;
	}
	function _isChecked(v, val){
		if (v == String(val) || $.inArray(v, $.isArray(val)?val:[val]) >= 0 || 'true' == String(val)){
			return true;
		} else {
			return false;
		}
	}
}

// 清空表单内容
ManageForm.clearForm = function(form){
	$('input,select,textarea', form).each(function(){
		var t = this.type, tag = this.tagName.toLowerCase();
		if (t == 'text' || t == 'hidden' || t == 'password' || tag == 'textarea'){
			$(this).val('');
		} else if (t == 'file'){
			var file = $(this);
			//file.remove();
		} else if (t == 'checkbox' || t == 'radio'){
			$(this).attr('checked', false);
		} else if (tag == 'select'){
			$(this).attr('selectedIndex', -1);
		}
	});
}

/**
 * bootstrap table基本操作
 * 官方文档：http://bootstrap-table.wenzhixin.net.cn/documentation/<br>
 * 官方文档：http://issues.wenzhixin.net.cn/bootstrap-table/
 */
var ManageGrid = ManageGrid || {};
// 刷新table
ManageGrid.refreshTable = function(table, url, param) {
	var queryParam = {};
	if(url){
		queryParam.url = url;
	}
	if(param){
		queryParam.query = param;
	}
	$(table).bootstrapTable('refresh', queryParam);
}
// 获取查询内容
ManageGrid.getSearchFields = function(table) {
	var searchFields = [];
	table.find('th').each(function(i) {
		var field = $(this).data('field');
		var searchable = $(this).data('searchable');
		if(field && searchable && searchable == true) {
			searchFields.push(field);
		}
	});
	return searchFields;
}
/**
 * 删除表格中多行记录
 * @param table    需要操作的table对象
 * @param url      需要进行的url操作
 * @param callback 操作完需要进行的回调函数
 * @param idKey    删除操作中需要用到的主键名称
 * @param msgOpts  操作完成后用于提示消息的json对象，根据服务端返回标记来填充
 */
ManageGrid.deleteMultiple = function(table, url, callback, idKey, msgOpts){
	var title = msgOpts && msgOpts.confirmTitle ? msgOpts.confirmTitle : '删除确认';
	var msg = msgOpts && msgOpts.confirmMsg ? msgOpts.confirmMsg : '您确认要删除';
	var rows = table.bootstrapTable('getSelections');
	if(rows.length > 0){
		createConfirmDialog(title, msg+rows.length+'条记录吗？', function(){
			var idArr = $.map(rows, function (row) {
                return row[idKey];
            });
			//console.log (idArr);
			Manage.save(url, {id:idArr}, callback, msgOpts);
		}).modal('show');
	} else {
		Layer.msg('请勾选您要删除的记录！');
	}
}
/**
 * 删除表格中多行记录 跨页删除
 * @param url      需要进行的url操作
 * @param callback 操作完需要进行的回调函数
 * @param idArr    需要删除的列数组对象
 * @param msgOpts  操作完成后用于提示消息的json对象，根据服务端返回标记来填充
 */
ManageGrid.deleteMultipleAll = function(url, callback, idArr, msgOpts){
	var title = msgOpts && msgOpts.confirmTitle ? msgOpts.confirmTitle : '删除确认';
	var msg = msgOpts && msgOpts.confirmMsg ? msgOpts.confirmMsg : '您确认要删除';
	if(idArr.length > 0){
		createConfirmDialog(title, msg+idArr.length+'条记录吗？', function(){
			//console.log (idArr);
			Manage.save(url, {id:idArr}, callback, msgOpts);
		}).modal('show');
	} else {
		Layer.msg('请勾选您要删除的记录！');
	}
}
/**
 * 删除表格中一行记录
 * @param msgOpts 操作完成后用于提示消息的json对象，根据服务端返回标记来填充
 */
ManageGrid.deleteSingle = function(url, callback, msgOpts){
	var title = msgOpts && msgOpts.confirmTitle ? msgOpts.confirmTitle : '删除确认';
	var msg = msgOpts && msgOpts.confirmMsg ? msgOpts.confirmMsg : '您确认要删除记录吗？';
	createConfirmDialog(title, msg, function(){
    	Manage.save(url, {}, callback, msgOpts);
    }).modal('show');
}
// 获取选中的id
ManageGrid.getIdSelections = function(table) {
    return $.map(table.bootstrapTable('getSelections'), function (row) {
        return row.id;
    });
}

/**
 * 加载
 */
ManageGrid.initTable = function(opts){
	
	if(!opts.table) return false;
	
	//销毁表格  
	opts.table.bootstrapTable('destroy');  
	
	//参数
	var limit = opts.limit ? opts.limit : undefined,										 // 分页参数显示条数
		offset = opts.offset ? opts.offset : undefined,										 // 分页参数页码
		firstLoadFlag = undefined == opts.firstLoadFlag ? undefined : opts.firstLoadFlag,	 // 首次加载
		toolbar = opts.toolbar ? opts.toolbar : '#tableToolbar',							 // 设置工具栏的Id或者class  
		uniqueId = opts.uniqueId ? opts.uniqueId : undefined,  								 // 每一行的唯一标识，一般为主键列
		clickToSelect = undefined == opts.clickToSelect ? undefined : opts.clickToSelect,	 // 点击行即可选中单选/复选框  			
		sidePagination = opts.sidePagination ? opts.sidePagination	: 'server',				 // 分页方式：client客户端分页，server服务端分页（*）
		pagination = undefined == opts.pagination ? undefined : true,						 // 在表格底部显示分页工具栏  	
		sortable = undefined == opts.sortable ? undefined : false, 						     // 是否启用排序
		sortName = opts.sortName ? opts.sortName : undefined,								 // 默认排序的列	
		sortOrder = opts.sortOrder ? opts.sortOrder : 'asc';								 // 排序方式
	var searchFields = ManageGrid.getSearchFields(opts.table);
	
	opts.table.bootstrapTable({
        url: opts.url,					// 请求url
        sortable: sortable, 			// 是否启用排序
        sortName: sortName, 			// 默认排序的列	
        sortOrder: sortOrder, 			// 排序方式
        uniqueId: uniqueId, 
        toolbar: toolbar, 
        clickToSelect: clickToSelect, 
        sidePagination: sidePagination, 
        pagination: pagination,
        queryParams: function (params) {
            params.searchProperty = searchFields;
            if (limit && limit != "") {
                if (firstLoadFlag) {
                    params.limit = parseInt(limit);
                    params.offset = parseInt(offset);
                }
            }
            limit = params.limit;
            offset = params.offset;
            
            if(opts.queryParams){
    			opts.queryParams(params);
        	}
            return params;
        },
        onDblClickRow: function (row, $element) {
        	if(opts.onDblClickRow){
    			opts.onDblClickRow(row, $element);
    		}
        },
        onClickRow: function (row, $element) {
        	if(opts.onClickRow){
        		opts.onClickRow(row, $element);
        	}
        },
        onCheck: function (row) {
        	if(opts.onCheck){
        		opts.onCheck(row);
        	}
        },
        onUncheck: function (row) {
        	if(opts.onUncheck){
        		opts.onUncheck(row);
        	}
        },
        onCheckAll: function (rows) {
        	if(opts.onCheckAll){
        		opts.onCheckAll(rows);
        	}
        },
        onUncheckAll: function (rows) {
        	if(opts.onUncheckAll){
        		opts.onUncheckAll(rows);
        	}
        },
        onLoadSuccess: function (data) {
            if (firstLoadFlag && offset != 0) {
                table.bootstrapTable("selectPage", offset/limit + 1);
            }
            
            firstLoadFlag = false;
            if(opts.onLoadSuccess){
    			opts.onLoadSuccess(data);
    		}
        }
    });
};



// jstree
var ManageTree = ManageTree || {};
/**
 * jsTree 初始化. 结点延迟异步加载需要在后台设置children属性值为true.<br>
 * 重要方法之一: tree.jstree('get_checked') 获取勾选的结点<br>
 * 重要方法之二: tree.jstree('get_selected') 获取选中的结点<br>
 * 重要方法之三: tree.jstree('refresh') 刷新树<br>
 * @param pluginArr 用到哪些插件,如经常使用的插件['checkbox']
 */
ManageTree.initTree = function(tree, url, pluginArr){
	if(tree){
		tree.jstree({
			'checkbox': {
				'keep_selected_style': false
			},
			'core': {
				'multiple': false,
				'data': {
					'url': function (node) {
						return url;
					},
					'data': function (node) {
						return {'id': node.id};
					}
				}
			},
			'plugins': pluginArr
		});
	}
}
//使用标志formatter
function sybzFormatter(value, row) {
    if('Y' == value) {
        return '<span style="color:green">启用</span>';
    }else if('N' == value){
    	 return '<span style="color:red">禁用</span>';
    }
    return '';
}


/**
 * 根据src属性配置请求加载生成select, checkbox, radio选项数据
 */
var ManageOption  = ManageOption || {};

//获取请求url
ManageOption.getAjaxUrl = function(){
	var optionPathName = document.location.pathname;
	var optionIndex = optionPathName.substr(1).indexOf("/");
	var optionContextPath = optionPathName.substr(0, optionIndex+1);
	return optionContextPath + "/getOptions";
}
/**
 * 根据src属性配置请求加载生成select, checkbox, radio选项数据
 * src参数格式范例之一：src="T:table:uid:name:1=1 order by column"<br>
 * src参数格式范例之二：src="D:dictionaryType"<br>
 * src参数格式范例之三：src="G:globalParameterName"
 */
ManageOption.initOptionData = function(scopeObj){
	var $scope = null;
	if(scopeObj && typeof(scopeObj) == "object"){
		$scope = scopeObj;
	} else if (scopeObj){
		$scope = $("#"+scopeObj);
	}
	if($scope){
		var vvparam = '';
		$("input,select",$scope).each(function(index,element){
			var $this = $(this);
			var name = $this.attr("name");
			var src = $this.attr("src");
			var flag = false;
			// for checkbox or radio
			if(($this.attr("type") == "radio" || $this.attr("type") == "checkbox") && src && (src.trim().startsWith('T:') || src.trim().startsWith('D:') || src.trim().startsWith('G:'))){
				flag = true;
				$this.hide();
			}
			// for select
			if($this.get(0).tagName == "SELECT" && src && (src.trim().startsWith('T:') || src.trim().startsWith('D:') || src.trim().startsWith('G:'))){
				flag = true;
			}
			if(flag) {
				var vparam = src.trim();
				while(vparam.indexOf("%") > 0){
					vparam = vparam.replace("%","$");
				}
				vvparam = name + ':' + vparam + ',';
			}
		});
		if(vvparam != '') {
			$.ajax({
				url: ManageOption.getAjaxUrl(),
				data: "v=" + vvparam + "&r="+ Math.random(),
				async:	false,
				dataType : 'json',
				success: function(res) {
					if(res.statusCode == '200'){
						var options = res.data;
						$("input,select",$scope).each(function(index,element){
							var $this = $(this);
							var name = $this.attr("name");
							var value = $this.attr("value");
							value = (value ? value : "");
							var optionData = options[name] ? options[name] : null;
							// for checkbox or radio
							if(optionData) {
								if($this.attr("type") == "radio" || $this.attr("type") == "checkbox") {
									var onclick = $this.attr("onclick");
									onclick = onclick ? "onclick='"+ $this.attr("onclick") + "'" : '';
									var disabled = $this.attr("disabled");
									disabled = disabled ? "disabled" : '';
									var temp = "";
									$.each(optionData,function(i,option){
										if($this.attr("type")=="radio"){
											temp +=("<label class='radio-inline'><input type='radio' "+onclick+" "+ disabled+" name='"+name+"' value='"+option.uid+"' sv='"+option.uid+"'>"+option.name+"</label>");
										} else {
											temp +=("<label class='checkbox-inline'><input type='checkbox' "+onclick+" "+ disabled+" name='"+name+"' value='"+option.uid+"' sv='"+option.uid+"'>"+option.name+"</label>");  
										}
									});
								}
								$this.after(temp);
								//处理默认值
								if(value != ''){
									var s = value.split(",");
									if(s && s.length > 0){
										for(var i = 0; i < s.length; i++){
											var t = $("input[sv="+s[i]+"]");
											if(t.length > 0 && t[0].name == name){
												t[0].checked = true;
											}	
										}
									}
								}
								// for select
								if($this.get(0).tagName == "SELECT") {
									var emptyValue = $this.attr("emptyValue");
									emptyValue = (emptyValue ? emptyValue : "--请选择--");
									var noEmptySelect = $this.attr("noEmptySelect");
									noEmptySelect = (noEmptySelect != undefined && !noEmptySelect ? false : true);
									if(noEmptySelect){
										$this.append("<option value=''>"+emptyValue+"</option>");
									}
									$.each(options[name],function(i,option){
										var uid = option.uid;
										var name = option.name;
										$this.append("<option value='"+uid+"'>"+name+"</option>");
									});
									//处理默认值
									if(value != ''){
										var t = 0;
										$this.find("option").each(function(){
											if(this.value == value){
												return false;
											} 
											t++;
										});
										if(t >= 0){
											$this.get(0).selectedIndex = t;
										}						
									}
								}
							}
						});
					}
				}
			});
		}
	}
}

/**
 * 根据src属性配置重新请求加载select数据<br>
 * src参数格式范例之一：src="T:table:uid:name:1=1 order by column"<br>
 * src参数格式范例之二：src="D:dictionaryType"<br>
 * src参数格式范例之三：src="G:globalParameterName"
 */
ManageOption.reloadSelect = function(obj){
	var src = obj.attr("src");
    if(src == undefined || src.trim() == '' || !(src.trim().startsWith('T:') || src.trim().startsWith('D:') || src.trim().startsWith('G:'))){
    	throw new Error('The "src" attr of this select is empty or invalid');
    }
	var emptyValue = obj.attr("emptyValue");
    emptyValue = (emptyValue ? emptyValue : "--请选择--");
    var value = obj.attr("value");
    value = (value ? value : "");
    var noEmptySelect = obj.attr("noEmptySelect");
    noEmptySelect = (noEmptySelect != undefined && !noEmptySelect ? false : true);
	
	obj.html('');
	var vparam = src.trim();
    while(vparam.indexOf("%") > 0){
    	vparam = vparam.replace("%","$");
    }
    $.ajax({
		url: ManageOption.getAjaxUrl(),
		data: "v=" + vparam + "&r=" + Math.random(),
    	async:	false,
    	dataType: 'json',
    	success: function(res) {
    		if(res.statusCode == '200'){
	    		if(noEmptySelect){
		    		obj.append("<option value=''>"+emptyValue+"</option>");
				}
				var options = res.data;
				$.each(options,function(i,option){	
					var uid = option.uid;
	                var name = option.name;
	                obj.append("<option value='"+uid+"'>"+name+"</option>");
				});
    		}
		}
	});
	//处理默认值
 	if(value != ''){
 		var t = 0;
 		obj.find("option").each(function(){	
			if(this.value == value){
				return false;
			} 
			t++;
		});
 		if(t > 0){
 			obj.get(0).selectedIndex = t;
		}						
 	}
}

// 通用js方法
var Manage = Manage || {};
Manage.save = function(url, jsonData, callback, msgOpts) {
	Layer.checkLayer();
	var loading = layer.load();
	$.ajax({
		url : url,
		data : jsonData,
		dataType : 'json',
		async : true,
		type : 'post',
		success : function(res) {
			layer.close(loading);
			Manage.msg(res, msgOpts);
			if (callback && res.statusCode == '200'){
				callback(res);
			}
		},
		error : function(xhr,error) {
			layer.close(loading);
			//console.log(error);
			var msg = error ? (error == 'timeout' ? '请求服务超时' : '请求失败') : '请求失败';
			Layer.msg(msg, 'error');
		}
	});
};



Manage.query = function(url, jsonParam, callback, options) {
	Layer.checkLayer();
	var loading;
	if(!options || !options.unmask) {
		loading = layer.load();
	}
	$.ajax({
		url : url,
		data : jsonParam,
		dataType : 'json',
		async : true,
		type : 'get',
		success : function(res) {
			if(loading) {
				layer.close(loading);
			}
			/*if (res.statusCode != "200") {//TODO 样式需要调整
				var html = "<div style='height:300px; width:400px;'>";
    			html += res.errMsg;
    			html += "<br/>";
    			html += res.errTrace;
    			html += "</div>";
    			Layer.openHtml ("系统错误", html);
			}*/
			if (callback) {
				callback(res);
			}
		},
		error : function(xhr,error) {
			if(loading) {
				layer.close(loading);
			}
			//console.log(error);
			var msg = error ? (error == 'timeout' ? '请求服务超时' : '请求失败') : '请求失败';
			Layer.msg(msg, 'error');
		}
	});
};

/**
 * 提示信息
 * @param {statusCode:200, message: '...'}
 */
Manage.msg = function(result, msgOpts){
	var callable = false;
	var msg = result.message;
	if(msgOpts && typeof(msgOpts) == "object" && msg == '') {
		msg = msgOpts[result.statusCode];
	}
	if(msgOpts && typeof(msgOpts) == "object" && result.message) {
		msg = msgOpts[result.message];
	}
	if(msgOpts && typeof(msgOpts) == "object" && typeof(msgOpts[result.statusCode]) == "function" && result.data) {
		callable = true;
		msgOpts[result.statusCode](result.data);
	}
	if(!callable) {
		if (result.statusCode == '425') {
			Layer.msg('浏览器会话也过期，请重新登录！', 'warning');
		} else if (result.statusCode == '400' || result.statusCode == '500') {
			/*if (result.statusCode == "500") {//TODO 处理系统异常//TODO 样式需要调整
				var html = "<div style='height:300px; width:400px;'>";
				html += result.errMsg;
				html += "<br/>";
				html += result.errTrace;
				html += "</div>";
				Layer.openHtml ("系统错误", html);
			} else {
				msg = msg ? msg : '操作失败';
				Layer.msg(msg, 'error');
			}*/
			if (result.statusCode != "500") {
				msg = msg ? msg : '操作失败';
				Layer.msg(msg, 'error');
			}
		} else if (result.statusCode == '401' || result.statusCode == '403' || result.statusCode == '406') {
			msg = msg ? msg : '操作受限';
			Layer.msg(msg, 'warning');
		} else if (result.statusCode == '200') {
			// 处理额外提供的操作成功信息
			if (msgOpts != null) {
				msg = msgOpts[result.statusCode];
			}
			msg = msg ? msg : '操作成功';
			Layer.msg(msg, 'success');
		} else {
			Layer.msg(msgOpts[result.statusCode], 'error');
		}
	}
}

/**
 * 路径跳转
 * 
 * 一般是2个页面相互跳转又需要记录一些数据时用到
 * 
 * @param url 页面跳转地址
 * @param param 需要传递的参数：一般为页面表格的limit，offset，或者选中行；具体根据自己业务传输
 * 
 */
Manage.url = function(url, params){
	url += url.indexOf("?") == -1 ? "?" : "";
	// 遍历所有params
	var urlParam = "";
	if (params != undefined) {
		$.each (params, function (key, value){
			urlParam +=  "&" + key + "=" + value;
		});
	}
	var realUrl = url + urlParam;
	realUrl = realUrl.replace("?&", "?").replace("&&", "&");
	window.location.href = realUrl;
}

var Layer = Layer || {};
/**
 * layer提示信息. type默认是'info'.<br>
 * -1: info, 0: warning, 1: success<br>
 * 2: error, 3: question, 4: limitation<br>
 * 5: failure, 6: smile
 */
Layer.msg = function(content, type, options) {
	Layer.checkLayer();
	var icon = -1;
	switch (type) {
		case 'warning':
			icon = 0;
			break;
		case 'success':
			icon = 1;
			break;
		case 'error':
			icon = 2;
			break;
		case 'question':
			icon = 3;
			break;
		case 'limitation':
			icon = 4;
			break;
		case 'failure':
			icon = 5;
			break;
		case 'smile':
			icon = 6;
			break;
	}
	// 顶部出现layer msg
	//var defaults = {offset: 20, shade: 0};
	// 中间出现layer msg
	var defaults = {offset: 400, shade: 0};
	var opts = $.extend({}, defaults, options);
	opts.icon = icon;
	content = content || '';
	parent.layer.msg(content, opts);
}
Layer.confirm = function(msg, determineCallback, cancelCallback) {
	Layer.checkLayer();
	layer.confirm(msg, 
		{
			icon: 3, title:'系统提示', 
			btn: ['确认','取消'] //按钮
		}, function(index) {
			layer.close(index);
			determineCallback();
		}, cancelCallback);
}
Layer.openIframe = function(title, iframeSrc, area) {
	Layer.checkLayer();
	var index = layer.open({
		type: 2,
		shadeClose: true,
		title: title,
		area: area,
		content: iframeSrc
	});
	return index;
}
Layer.openHtml = function(title, html, successFun, area) {
	Layer.checkLayer();
	var index = layer.open({
		type: 1,
		shadeClose: true,
		title: title,
		content: html,
		area: area,
		success: successFun
	});
	return index;
}
Layer.checkLayer = function() {
	if(layer === undefined || parent === undefined || parent.layer === undefined) {
		throw new Error('Layer JavaScript requires layer');
	}
}

var Toastr = Toastr || {};
/**
 * Toastr提示信息. type默认是'info'
 */
Toastr.msg = function(content, type, options) {
	if(toastr === undefined) {
		throw new Error('Toastr JavaScript requires toastr');
	}
	type = type || "info";
	content = content || "操作成功";
	var title = options.title || "系统提示";
	toastr.options = {
			closeButton: true,
			debug: false,
			progressBar: true,//进度条
			positionClass: "toast-bottom-right",//显示区域
			onclick: null,
			showDuration: 400,//显示持续时间
			hideDuration: 1000,//隐藏持续时间
			timeOut: 2000,//超时
			extendedTimeOut: 1000,//延迟
	};
	toastr.options = $.extend(toastr.options, options);
	toastr[type](content, title);
	//toastr.clear();清除
};

var JqGrid = JqGrid || {};
/**
 * jqgrid官方文档：http://www.trirand.com/jqgridwiki/doku.php?id=wiki:jqgriddocs<br>
 * jqgrid官方例子：http://www.guriddo.net/demo/guriddojs/<br>
 * jqgrid预设的单元格格式化类型：http://www.trirand.com/jqgridwiki/doku.php?id=wiki:predefined_formatter<br>
 * 重要方法之一：grid.trigger(“reloadGrid”) 重新加载数据<br>
 * 重要方法之二：grid.getGridParam("selrow") 单选时获得选中的行ID<br>
 * 重要方法之三：grid.getGridParam("selarrrow") 多选时获得选中的行ID数组<br>
 */
JqGrid.initGrid = function(grid) {
	var $jqGrid = null;
    if(grid && typeof(grid) == "object"){
    	$jqGrid = grid;
    } else if (grid){
    	$jqGrid = $("#"+grid);
	}
	var pageid = '';
	var expandColumn;
	var treeGridModel = undefined;
	var pagination = $jqGrid.attr('pagination');
	var rownumbers = $jqGrid.attr('rownumbers');
	var treeGrid = $jqGrid.attr('treeGrid');
	if(treeGrid) {
		rownumbers = false;
		pagination = false;
		expandColumn = $jqGrid.attr('expandColumn');
		treeGridModel = $jqGrid.attr('treeGridModel');
		treeGridModel = treeGridModel ? treeGridModel : 'adjacency';
	}
	if(pagination) {
		pageid = 'page_' + new Date().getTime();
		$jqGrid.after('<div id="' + pageid + '"></div>');
	}
	var url = $jqGrid.attr('url');
	var viewrecords = $jqGrid.attr('viewrecords');
	var caption = $jqGrid.attr('caption');
	var height = $jqGrid.attr('height');
	var rowNum = $jqGrid.attr('rowNum');
	var sortname = $jqGrid.attr('sortname');
	var sortorder = $jqGrid.attr('sortorder');
	var multiselect = $jqGrid.attr('multiselect');
	var colModel = [];
	var cmodel;
	$("th", $jqGrid).each(function(i) {
		cmodel = {};
		cmodel.label = $.trim($(this).text());
		cmodel.name = $(this).attr('name');
		var index = $(this).attr('index');
		cmodel.index = (index ? index : cmodel.name);
		var width = $(this).attr('width');
		if(width) {
			cmodel.width = width;
		}
		var align = $(this).attr('align');
		if(align) {
			cmodel.align = align;
		}
		var key = $(this).attr('key');
		if(key) {
			cmodel.key = true;
		}
		var sorttype = $(this).attr('sorttype');
		if(sorttype) {
			cmodel.sorttype = sorttype;
		}
		var formatter = $(this).attr("formatter");
		if(formatter) {
			try {
				cmodel.formatter = eval(formatter);
			} catch(e) {
				throw e;
			}
		}
		var hidden = $(this).attr('hidden');
		cmodel.hidden = (hidden && hidden == 'hidden' ? true : false);
		var sortable = $(this).attr('sortable');
		cmodel.sortable = (sortable ? true : false);
		var fixed = $(this).attr("fixed");
		cmodel.fixed = (fixed ? true : false);
		var resizable = $(this).attr("resizable");
		cmodel.resizable = (resizable != undefined && !resizable ? false : true);
		colModel[i] = cmodel;
	});
	
	var loadComplete = $jqGrid.attr("loadComplete");
	var gridComplete = $jqGrid.attr("gridComplete");
	var onSelectRow = $jqGrid.attr("onSelectRow");
	var onSelectAll = $jqGrid.attr("onSelectAll");
	
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
	$.jgrid.defaults.height = 300;
	var gridConfig = {
		url: url,
		datatype: 'json',
		pager: pagination ? '#' + pageid : undefined,
		viewrecords: (viewrecords != undefined && !viewrecords ? false : true),
		caption: caption,
		height: height,
		autowidth: true,
		multiboxonly: true,
		// enable tree grid
		treeGrid: (treeGrid ? true : false),
		// which column is expandable
		ExpandColumn: expandColumn,
		// datatype
		treedatatype: "json",
		// the model used
		treeGridModel: treeGrid ? treeGridModel : undefined,
		// configuration of the data comming from server
		treeReader: treeGrid ? {level_field:'level', leaf_field:'isLeaf', expanded_field:'expanded', parent_id_field:'parent'} : undefined,
		treeIcons: treeGrid ? {leaf:'glyphicon glyphicon-leaf'} : undefined,
		altRows: false,
		prmNames: {rows:'limit', sort:'sort', order:'order'},
		jsonReader: treeGrid ? undefined : {total:'records', records:'total'},
		rowList: [10,20,50,100],
		rownumbers: (rownumbers != undefined && !rownumbers ? false : true),
		rowNum: (rowNum ? rowNum : 10),
		sortname: sortname,
		sortorder: sortorder,
		multiselect: (multiselect != undefined && !multiselect ? false : true),
		colModel: colModel,
		loadComplete: loadComplete == undefined ? undefined : function(data){
			var table = this;
			eval(loadComplete+"("+data+","+table+")");
		},
		gridComplete: gridComplete == undefined ? undefined : function(){
			eval(gridComplete+"()");
		},
		onSelectRow : onSelectRow == undefined ? undefined : function(row_id, status){ 
			eval(onSelectRow+"("+row_id+","+status+")");
		},
		onSelectAll : onSelectAll == undefined ? undefined : function(row_ids, status){
			eval(onSelectAll+"("+row_ids+","+status+")");
		}
	};
	//console.log(gridConfig);
	$jqGrid.jqGrid(gridConfig);
}

var REGX_HTML_ENCODE = /"|&|'|<|>|[\x00-\x20]|[\x7F-\xFF]|[\u0100-\u2700]/g;
var REGX_HTML_DECODE = /&\w+;|&#(\d+);/g;
var REGX_TRIM = /(^\s*)|(\s*$)/g;
var HTML_DECODE = {
    "&lt;" : "<",
    "&gt;" : ">",
    "&amp;" : "&",
    "&nbsp;": " ",
    "&quot;": "\"",
    "&apos;": "\'",
    "©": ""
    // Add more
};
String.prototype.trim = function(){
    return this.replace(REGX_TRIM, "");
}
String.prototype.startsWith = function(str){
    return (this.match("^"+str)==str);
}
String.prototype.endsWith = function(str){
    return (this.match(str+"$")==str);
}
String.prototype.encodeHtml = function(){
    return this.replace(REGX_HTML_ENCODE, 
              function($0){
                  var c = $0.charCodeAt(0), r = ["&#"];
                  c = (c == 0x20) ? 0xA0 : c;
                  r.push(c); r.push(";");
                  return r.join("");
              });
}
String.prototype.decodeHtml = function(){
    return this.replace(REGX_HTML_DECODE,
              function($0, $1){
                  var c = HTML_DECODE[$0];
                  if(c == undefined){
                      if(!isNaN($1)){
                          c = String.fromCharCode(($1 == 160) ? 32:$1);
                      } else {
                          c = $0;
                      }
                  }
                  return c;
              });
}

var DATE_FORMAT = "yyyy-MM-dd";
Date.prototype.format = function(fmt){
	var o = {
		"M+" : this.getMonth()+1,                 //月份
		"d+" : this.getDate(),                    //日
		"h+" : this.getHours(),                   //小时
		"m+" : this.getMinutes(),                 //分
		"s+" : this.getSeconds(),                 //秒
		"q+" : Math.floor((this.getMonth()+3)/3), //季度
		"S"  : this.getMilliseconds()             //毫秒
	};
	if(/(y+)/.test(fmt))
		fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	for(var k in o)
		if(new RegExp("("+ k +")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	return fmt;
}
function getDateBeforeDays(day){
    var zdate=new Date();
    var sdate=zdate.getTime()-(1*24*60*60*1000);
    var edate=new Date(sdate-(day*24*60*60*1000)).format(DATE_FORMAT);
    return edate;
}
/**
 * 显示或隐藏一组对象
 * @param [{target:target1, visible:true},{target:target2, visible:false},...]
 */
function displayElement(options) {
	if(options){
		for(var cf in options){
			var eleCf = options[cf];
			if(eleCf.visible){
				eleCf.target.show();
			} else {
				eleCf.target.hide();
			}
		}
	}
}

/**
 * form验证
 */
Manage.validate = function(options){
	
	var ignore = (options && options.ignore) ? options.ignore : undefined;
	
	$("form").validate({
		ignore:ignore,
        errorElement: "em",
        errorPlacement: function(error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents(".col-sm-9").addClass("has-feedback");

            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!element.next("span")[0]) {
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(element);
            }
        },
        success: function (label, element) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if (!$(element).next("span")[0]) {
                $("<span class='glyphicon glyphicon-ok form-control-feedback'></span>").insertAfter($(element));
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".col-sm-9").addClass("has-error").removeClass("has-success");
            $(element).next("span").addClass("glyphicon-remove").removeClass("glyphicon-ok");
        },
        unhighlight: function ( element, errorClass, validClass ) {
            $(element).parents(".col-sm-9").addClass("has-success").removeClass("has-error");
            $(element).next("span").addClass("glyphicon-ok").removeClass("glyphicon-remove");
        }
    });
}

/**
 * 构建页面普通的下拉框
 * 
 * @param url 请求地址
 * @param item 页面元素
 * @param zdbh 字典编号
 * @param defaultValue 选中值
 */
function addSelect (url, item, zdbh, defaultValue) {
	Manage.query (url, {zdbh:zdbh}, function (result){
        if (result.statusCode == "200") {
        	var optionHtml = "";
        	optionHtml += "<option></option>";
        	$.each(result.data ,function(i, xtzd){
        		optionHtml += "<option ";
        		optionHtml += "value='" + xtzd.zdxz + "'";
        		if (defaultValue == xtzd.zdxz) {
        			optionHtml += " selected";
        		}
        		optionHtml += ">";
        		optionHtml += xtzd.zdxm;
        		optionHtml += "</option>";
        	});
        	$("#" + item).html(optionHtml);
        }
    });
}

/**
 * post url方式打开window
 * 
 * @param url 请求地址
 * @param data 传递的值
 * @param name target名称
 */
function openPostWindow(url, data, name) {
	//判断表单是否存在，若不存在则在body中添加form表单  
	if($("#tempForm").length <=0 ){  
	    var form = "<form id='tempForm' action='" + url + "' method='post' target='" + name + "'>" + 
	            "<input type='hidden' id='sid' name='sid'/>" + 
	            "</form>";
	    $("body").append(form);//在body中添加form表单  
	}
	//将用户名和密码保存到form表单的隐藏域中  
	$("#sid").val(data);
	//打开新的窗口  
	window.open('', name);
	//提交表单  
	$("#tempForm").submit();
	$("#tempForm").remove();
}

