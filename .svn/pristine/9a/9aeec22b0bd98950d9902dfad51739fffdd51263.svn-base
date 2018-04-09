<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/template/head_basic.jsp" />
<link
	href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />"
	rel="stylesheet" type="text/css" />
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<!-- 标题div -->
			<div class="ibox-title">
				<!-- 标题 -->
				<h5><spring:message code="pubJqxz.add" /></h5>
				<!--必填提示  -->
				<span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>

			</div>
			<div class="ibox-content">
				<!-- form表单 -->
				<form class="form-horizontal formW60p">
					<!-- 上级警情性质名称 -->
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message
								code="pubJqxz.parentJg" />:</label>
						<div class="col-sm-9">
							<input type="text" id="zyfName" name="zyfName" class="form-control timebox" <c:if test="${not empty zdfName}">value="${zdfName}"</c:if> readonly>
						</div>
					</div>
					<!-- 上级警情性质编号 -->
					<div class="form-group">
						<label for="bzjqxzfbh" class="col-sm-3 control-label"> <spring:message code="pubJqxz.parentbh" />:
						</label>
						<div class="col-sm-9">
							<input id="bzjqxzfbh" name="bzjqxzfbh" class="form-control" readonly>
						</div>
					</div>
					<!-- 警情性质编号 -->
					<div class="form-group">
						<label for="jqxzbh" class="col-sm-3 control-label"> <span
							class="fieldRequired">*</span>&nbsp;<spring:message
								code="pubJqxz.jqxzbh" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="jqxzbh" name="jqxzbh" class="form-control" required
								maxLength="12" noChinese="true"
								remote="<c:url value='/pubJqxz/validateJqxzbh' />">
						</div>
					</div>
					<!-- 警情性质简称 -->
					<div class="form-group">
						<label for="jqxzjc" class="col-sm-3 control-label"><spring:message
								code="pubJqxz.jqxzjc" />: </label>
						<div class="col-sm-9">
							<input type="text" id="jqxzjc" name="jqxzjc" class="form-control" maxLength="32">
						</div>
					</div>
					<!--警情性质简称拼音码  -->
					<div class="form-group">
						<label for="jqxzjcpym" class="col-sm-3 control-label"><spring:message
								code="pubJqxz.jqxzjcpym" />: </label>
						<div class="col-sm-9">
							<input type="text" id="jqxzjcpym" name="jqxzjcpym" class="form-control" maxLength="128">
						</div>
					</div>
					<!-- 警情性质全称 -->
					<div class="form-group">
						<label for="jqxzqc" class="col-sm-3 control-label"><spring:message
								code="pubJqxz.jqxzqc" />: </label>
						<div class="col-sm-9">
							<input type="text" id="jqxzqc" name="jqxzqc" class="form-control" maxLength="32">
						</div>
					</div>
					<!-- 标准警情性质编号 -->
					<div class="form-group">
						<label for="bzjqxzbh" class="col-sm-3 control-label"><span
							class="fieldRequired">*</span>&nbsp;<spring:message
								code="pubJqxz.bzjqxzbh" />: </label>
						<div class="col-sm-9">
							<input type="text" id="bzjqxzbh" name="bzjqxzbh" class="form-control" required="required" maxLength="12" noChinese="true">
						</div>
					</div>
					<!-- 标准警情性质名称 -->
					<div class="form-group">
						<label for="bzjqxzmc" class="col-sm-3 control-label"><spring:message
								code="pubJqxz.bzjqxzmc" />: </label>
						<div class="col-sm-9">
							<input type="text" id="bzjqxzmc" name="bzjqxzmc" class="form-control" maxLength="32">
						</div>
					</div>

					<!-- 数据来源代码 -->
					<div class="form-group ">
						<label class="col-sm-3 control-label">数据来源:</label>
						<div class="col-sm-9">
							<select id="sjlydm" name="sjlydm" class="form-control"
								onchange="acquire_text('#sjlydm','#sjlyms')">
								<option value="">请选择数据来源...</option>
							</select>
						</div>
					</div>
					<!-- 数据来源描述 -->
					<input id="sjlyms" name="sjlyms" style="display: none;">
					<!--警情性质预案地址  -->
					<div class="form-group">
						<label for="jqxzyaurl" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jqxzyaurl" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="jqxzyaurl" name="jqxzyaurl" class="form-control" maxLength="64">
						</div>
					</div>
					<!-- 旧警情性质代码 -->
					<div class="form-group">
						<label for="jjqxzdm" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jjqxzdm" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="jjqxzdm" name="jjqxzdm" class="form-control" maxLength="12" digits="true">
						</div>
					</div>
					<!-- 旧警情性质名称 -->
					<div class="form-group">
						<label for="jjqxzmc" class="col-sm-3 control-label"> <spring:message
								code="pubJqxz.jjqxzmc" />:
						</label>
						<div class="col-sm-9">
							<input type="text" id="jjqxzmc" name="jjqxzmc" class="form-control" maxLength="32">
						</div>
					</div>
					<!-- 110用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz110" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz110_checkbox" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz110" id="yhsybz110" value="Y"> -->
<!-- 					</div> -->
					<!--122用户使用标志  -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz122" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz122_checkbox" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz122" id="yhsybz122" value="Y"> -->
<!-- 					</div> -->
					<!-- 120用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz120" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz120_checkbox" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz120" id="yhsybz120" value="Y"> -->
<!-- 					</div> -->
					<!-- 119用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz119" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz119_checkbox" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz119" id="yhsybz119" value="Y"> -->
<!-- 					</div> -->
					<!-- 其他用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.qtyhsybz" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="qtyhsybz_checkbox" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="qtyhsybz" id="qtyhsybz" value="Y"> -->
<!-- 					</div> -->
					<!-- 使用标志 -->
					<div class="form-group">
						<label for="sybz" class="col-sm-3 control-label"><spring:message
								code="pubJqxz.sybz" />:</label>
						<div class="col-sm-9">
							<input type="checkbox" id="sybz_checkbox" />
						</div>
						<input type="hidden" name="sybz" id="sybz" value="Y">
					</div>
					<!-- 底部按钮组 -->
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="button" class="btn btn-primary" id="saveBtn">
                            	 <i class="fa fa-check"></i>&nbsp;<spring:message code="determine" />
                            </button>
                            <button type="button" class="btn btn-default" id="cancelBtn">
                            	<i class="fa fa-close"></i>&nbsp;<spring:message code="cancel" />
                            </button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script
		src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script type="text/javascript"
		src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script type="text/javascript">

	$(function () {
		//初始化表单验证
		Manage.validate();
		//使用标志
	    $("#sybz_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#sybz').val(state ? 'Y' : 'N');
	        }
	    });
	    //110用户使用标志
	    $("#yhsybz110_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#yhsybz110').val(state ? 'Y' : 'N');
	        }
	    });
	    //122用户使用标志
	    $("#yhsybz122_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#yhsybz122').val(state ? 'Y' : 'N');
	        }
	    });
	    //120用户使用标志
	    $("#yhsybz120_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#yhsybz120').val(state ? 'Y' : 'N');
	        }
	    });
	    //119用户使用标志
	    $("#yhsybz119_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#yhsybz119').val(state ? 'Y' : 'N');
	        }
	    });
	    //其它用户使用标志
	    $("#qtyhsybz_checkbox").bootstrapSwitch({
	    	state:true,
	        onText : '<spring:message code="enable" />',
	        offText : '<spring:message code="disable" />',
	        onColor:'success',
	        offColor:'danger',
	        onSwitchChange:function(event, state){
	        	$('#qtyhsybz').val(state ? 'Y' : 'N');
	        }
	    });
	    
	     //加载上级警情性质树
	    /* $("#zyfName").click(function() {
	    	$("#typeTree").show();
	    	loadTree();
	   }); */  
	    
		lodaSelect("sjlydm","<c:url value='/pubXtzd/getPubXtzdList' />","system_sjly");//数据来源下拉框

	    
	    //保存
	    $('#saveBtn').click(function(){
	        ManageForm.submitForm($('form'), "<c:url value='/pubJqxz/saveAdd'/>", {submitFun:function(){$('#cancelBtn').click();}});
	    });
	    //返回
	    $('#cancelBtn').click(function(){
	    	//父类(index主页)先刷新子页在关闭，顺序不可变
	    	parent.refreshTable();
	    	parent.closeLayer();
	    });
	 
	    var dd;
	    var dropdownResult;
	    Manage.query ("<c:url value='/pubJqxz/getTree' />", null, function (result){
	        if (result.statusCode == "200") {
	            dropdownResult = result.data;
	        }
	    });
	    
	 // 树形下拉框加载标志，如果加载过就不要执行jstree构建
	    var treeLoadFlag = false;
	    $("#zyfName").focus(function() {
		    dd = Public.dropdown($("#zyfName"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
		    	if (!treeLoadFlag) {
	                treeLoadFlag = true;
			    	var typeTree = $('#typeTree');
		   			if (dropdownResult != undefined) {
		                loadTree(typeTree);
		            } else {
		                dd.hide();
		            }
		    	}
		    }});
	    });
	    
	    function loadTree(typeTree) {
	    	typeTree.jstree({
	            'checkbox': {
	                'keep_selected_style': false
	            },
	            'core': {
	                'multiple': false,
	                'data': dropdownResult
	            },
	        });
	        typeTree.on('select_node.jstree', function (e, data) {
	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
	            $('#zyfName').val(nodeTxt);
	            var jqxzbh = data.selected[0]; 
	        	$("#bzjqxzfbh").val(jqxzbh);
	            if (dd != undefined) {
	            	dd.hide();
	            }
	        });
	    }
        
	    
	});
	
	/*  var treeDiv;
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false; 
    function loadTree() {
        treeDiv = Public.dropdown($("#zyfName"), '<div id="typeTree" style="padding: 10px;"></div>', {
        	onShow:function(){
	        	if (!treeLoadFlag) {
	        		treeLoadFlag = true;
	        		$("#typeTree").jstree({
	                    'checkbox': {
	                        'keep_selected_style': false
	                    },
	                    'core' : {
	                        'data' : {
	                            "url" : "<c:url value='/pubJqxz/getTree'/>",
	                            "data" : function (node) {
	                                return { "bzjqxzbh" : node.id };
	                            }
	                        }
	                    }
	                });
	                
	                $("#typeTree").on('select_node.jstree', function (e, data) {
	                    var nodeTxt = data.instance.get_node(data.selected[0]).text;
l/	                    $('#zyfName').val(nodeTxt);
	                    treeDiv.hide();
	                    var jqxzbh = data.selected[0]; 
	                	$("#olddjqxz").val(jqxzbh);
                	});
        		}
        	}
		});
	}  */
    
  	//加载下拉框方法
	function lodaSelect(id, url, zdbh) {
		Manage.query(url, { zdbh : zdbh }, function(result) {
			if (result.statusCode == "200") {
				var pubXtzds = result.data;//获取后台数据
				$.each(pubXtzds, function(n, value) {
					$("#" + id).append("<option value='"+value.zdxz+"'>" + value.zdxm + "</option>");//js生成option标签
					$("#" + id).trigger("chosen:updated"); //更新chosen_select下拉菜单
				});
			}
		});
	}
  
	//select text获取及设置
	function acquire_text(select, id) {
		var sjlyms=$(select + " option:selected").text()
		if (sjlyms=="请选择数据来源...") {
			$(id).val("");
		}else {
			$(id).val(sjlyms);
		}	
	}
	
</script>
</body>
</html>