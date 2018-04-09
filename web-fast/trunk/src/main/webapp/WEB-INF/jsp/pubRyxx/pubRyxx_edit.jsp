<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<!-- 头部 -->
<head>
<!-- CSS库 -->
<jsp:include page="/common/template/head_basic.jsp" />
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/chosen/css/chosen.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/bootstrap-icon-picker/css/icon-picker.css' />" rel="stylesheet" type="text/css" />

</head>
<!-- 主体 -->
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
			<!--标题  -->
				<h5><spring:message code="pubRyxx.edit" /></h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="ibox-content">
			<!-- form表单 -->
				<form class="form-horizontal formW60p">
				<!--人员编号  -->
				<input id="rybh" name="rybh" style="display: none;">
					<input id="sjbb" name="sjbb" style="display: none;">
                   <!--人员姓名-->
					<div class="form-group">
						<label for="ryxm" class="col-sm-3 control-label"> <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.ryxm" />:</label>
						<div class="col-sm-9">
							<input id="ryxm" name="ryxm" class="form-control" placeholder="<spring:message code="pubRyxx.ryxm" />" required maxLength="12">
						</div>
					</div>
                <!--人员警号  -->
					<div class="form-group">
						<label for="ryjh" class="col-sm-3 control-label"> <span class="fieldRequired">*</span>&nbsp;s<spring:message code="pubRyxx.ryjh" />:</label>
						<div class="col-sm-9">
							<input id="ryjh" name="ryjh" class="form-control" placeholder="<spring:message code="pubRyxx.ryjh" />" required maxLength="12">
						</div>
					</div>
					<!--身份证编号-->
					<div class="form-group">
						<label for="sfzbh" class="col-sm-3 control-label"> <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.sfzbh" />:</label>
						<div class="col-sm-9">
							<input id="sfzbh" name="sfzbh" class="form-control" placeholder="<spring:message code="pubRyxx.sfzbh" />" required maxLength="18" sfzhmFormat="true"> 
						</div>
					</div>
					<!-- 人员性别 -->
					<div class="form-group">
						<label for="ryxb" class="col-md-3 control-label"><spring:message code="pubRyxx.ryxb" />:</label>
						<div class="col-sm-9">
						<!--性别下拉框  -->
							<select id="ryxb" name="ryxb"  class="chosen-select" data-placeholder="请选择人员性别..." onchange="acquire_text('#ryxb','#xbms')" style="width: 100%;" tabindex="-1">
								<option value=""></option>
							</select>
						</div>
					</div>
					<!-- 性别描述 -->
					<input type="text" id="xbms" name="xbms" style="display: none;" >
					<!--出生年月  -->
					<div class="form-group">
						<label for="csny" class="col-sm-3 control-label"> <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.csny" />:</label>
						<div class="col-sm-9">
							<input type="text" id="csnys" name="csnys"readonly="readonly"  onclick="laydate()" class="form-control" placeholder="<spring:message code="pubRyxx.csny" />" required>
						</div>
					</div>
					<!-- 人员状态 -->
					<div class="form-group">
						<label for="ryzt" class="col-md-3 control-label"><spring:message code="pubRyxx.ryzt" />:</label>
						<div class="col-sm-9">
						<!--状态下拉框  -->
							<select id="ryzt" name="ryzt" data-placeholder="请选择人员状态..." class="chosen-select" onchange="acquire_text('#ryzt','#ryztms')" style="width: 100%;" tabindex="-1">
								<option value=""></option>
							</select>
						</div>
					</div>
					<!-- 人员状态描述 -->
					<input type="text" id="ryztms" name="ryztms" style="display: none;">
					<!--人员职务  -->
					<div class="form-group">
						<label for="ryzw" class="col-md-3 control-label"><spring:message code="pubRyxx.ryzw" />:</label>
						<div class="col-sm-9">
						<!--职务下拉框  -->
							<select id="ryzw" name="ryzw" data-placeholder="请选择人员职务..." class="chosen-select" onchange="acquire_text('#ryzw','#zwms')" style="width: 100%;" tabindex="-1">
								<option value=""></option>
							</select>
						</div>
					</div>
					<!-- 职务描述 -->
					<input type="text" id="zwms" name="zwms" style="display: none;">
					
					<!-- 指挥中心编号 -->
					<div class="form-group">
						<label for="zhzxbh" class="col-sm-3 control-label"> <spring:message code="pubRyxx.zhzxbh" />:</label>
						<div class="col-sm-9">
							<input id="zhzxbh" name="zhzxbh" class="form-control" placeholder="<spring:message code="pubRyxx.zhzxbh" />">
						</div>
					</div>		
					<!-- 所属单位名称 -->
					<div class="form-group ">
						<label class="col-sm-3 control-label"><spring:message code="pubRyxx.ssdwmc" />:</label>
						<div class="col-sm-9">
							<input id="ssdwmc" name="ssdwmc" class="form-control" placeholder="<spring:message code="pubRyxx.ssdwmc" />" readonly>
						</div>
					</div>
					<!-- 所属单位代码-->
					<div class="form-group ">
						<label for="ssdwdm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.ssdwdm" />: </label>
						<div class="col-sm-9">
							<input id="ssdwdm" name="ssdwdm" class="form-control" placeholder="<spring:message code="pubRyxx.ssdwdm" />" readonly>
						</div>
					</div>
					<!-- 行政区划 -->
					<div class="form-group">
						<label for="xzqh" class="col-md-3 control-label"><spring:message code="pubRyxx.xzqh" />:</label>
						<div class="col-sm-9">
							<input id="xzqh" name="xzqh" class="form-control" placeholder="<spring:message code="pubRyxx.xzqh" />" readonly>
						</div>
					</div>
                       <!-- 警务通号码 -->
					<div class="form-group">
						<label for="jwthm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.jwthm" />:</label>
						<div class="col-sm-9">
							<input id="jwthm" name="jwthm" class="form-control" placeholder="<spring:message code="pubRyxx.jwthm" />" maxlength="11">
						</div>
					</div>
                   <!--电话号码  -->
					<div class="form-group">
						<label for="dhhm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.dhhm" />:</label>
						<div class="col-sm-9" id="divdhhm" name= "divdhhm">
							<input id="dhhm" name="dhhm" class="form-control" placeholder="<spring:message code="pubRyxx.dhhm" />" maxLength="256" manyMobiles="true">
						</div>
					</div>
                       <!-- 电台号码 -->
					<div class="form-group">
						<label for="dthm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.dthm" />:</label>
						<div class="col-sm-9">
							<input id="dthm" name="dthm" class="form-control" placeholder="<spring:message code="pubRyxx.dthm" />" maxLength="256" manyMobiles="true">
						</div>
					</div>
					<!--邮件地址  -->
					<div class="form-group">
						<label for="yjdz" class="col-sm-3 control-label"> <spring:message code="pubRyxx.yjdz" />:</label>
						<div class="col-sm-9">
							<input id="yjdz" name="yjdz" class="form-control" placeholder="<spring:message code="pubRyxx.yjdz" />">
						</div>
					</div>
					<!--人员住址  -->
					<div class="form-group">
						<label for="ryzz" class="col-sm-3 control-label"> <spring:message code="pubRyxx.ryzz" />:</label>
						<div class="col-sm-9">
							<input id="ryzz" name="ryzz" class="form-control" placeholder="<spring:message code="pubRyxx.ryzz" />" maxLength="64">
						</div>
					</div>
					<!--排序代码  -->
					<div class="form-group">
						<label for="pxdm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.pxdm" />:</label>
						<div class="col-sm-9">
							<input id="pxdm" name="pxdm" class="form-control" placeholder="<spring:message code="pubRyxx.pxdm" />" digits="true">
						</div>
					</div>
					<!-- 使用标志 -->
					<div class="form-group">
						<label for="sybz" class="col-sm-3 control-label"><spring:message code="pubRyxx.sybz" />:</label>
						<div class="col-sm-9">
							<input type="checkbox" id="sybz_checkbox" />
						</div>
						<input type="hidden" name="sybz" id="sybz" value="Y">
					</div>
					<!-- 按钮组 -->
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
						    <!--保存按钮-->
							<button type="button" class="btn btn-primary" id="saveBtn"><spring:message code="determine" /></button>
							&nbsp;&nbsp;
							<!--取消按钮-->
							<button type="button" class="btn btn-default" id="cancelBtn"><spring:message code="cancel" /></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--js库  -->
	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script type="text/javascript"src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/common/static/plugins/chosen/js/chosen.js' />"></script>
	<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
	<script type="text/javascript">
	/*from表单验证  */
		$(function() {

			 /*载入人员信息数据  */
			var pubRyxx = ${pubRyxx};
			ManageForm.loadForm($('form'), pubRyxx);
			
			var csny = pubRyxx.csny;//获取当前人员出生年月
			var ryxbs=pubRyxx.ryxb;//获取当前人员性别
			var ryzts=pubRyxx.ryzt;//获取当前人员状态
			var ryzws=pubRyxx.ryzw;//获取当前人员职务
			lodaSelect("ryxb","<c:url value='/getPubXtzdList' />","system_xb",ryxbs);//人员性别下拉框
			lodaSelect("ryzt","<c:url value='/getPubXtzdList' />","system_ryzt",ryzts);//人员状态下拉框
			lodaSelect("ryzw","<c:url value='/getPubXtzdList' />","system_ryzw",ryzws);//人员职务下拉框
			
			//var dhhms=$('#dhhm').val();
			var dhhms=pubRyxx.dhhm;
/* 			alert(dhhms);
			for (var int = 0; int < dhhms.split(",").length; int++) {
				alert(dhhms.split(",").get(int));
} */
		
	
			
			/*出生年月日期转换  */
			if (csny != null && csny != '') {
				$('#csnys').val(moment(csny).format('YYYY-MM-DD'));
			}
			
			/*  适配标志事件*/
			var sybztate = 'Y' == pubRyxx.sybz ? true : false;
			$("#sybz_checkbox").bootstrapSwitch({
				state : sybztate,//设置使用标志值
				onText : '<spring:message code="enable" />',//启用
				offText : '<spring:message code="disable" />',//禁用
				onColor : 'success',//设置启用标志颜色
				offColor : 'danger',//设置禁用标志颜色
				onSwitchChange : function(event, state) {
					$('#sybz').val(state ? 'Y' : 'N');
				}
			});
			//加载所属单位目录树
			$("#ssdwmc").focus(function() {
				loadTree('ssdwmc','ssdwdm');
			});
			
			/*保存  */
			$('#saveBtn').click(function() {ManageForm.submitForm($('form'),"<c:url value='/pubRyxx/saveEdit' />", {submitFun : function() {$('#cancelBtn').click();}});
					});
			/*取消  */
			$('#cancelBtn').click(function() {
				window.location.href = "<c:url value='/pubRyxx/index' />";
			});		
		});
	
		// 构建下拉框树
		var treeDiv;
		// 树形下拉框加载标志，如果加载过就不要执行jstree构建
        var treeLoadFlag = false;
		/* 获取所属单位目录树 */
		function loadTree(dwmc, dwdm) {
			treeDiv = Public.dropdown($("#"+dwmc), '<div id="typeTree_'+dwmc+'" style="padding: 10px;"></div>', {onShow:function(){
				if (!treeLoadFlag) {
                    treeLoadFlag = true;
					$("#typeTree_"+dwmc).jstree({
			            'checkbox': {
			                'keep_selected_style': false
			            },
			            'core' : {
			                'data' : {
			                    "url" : "<c:url value='/pubZzjg/getTree?type=0' />",
			                    "data" : function (node) {
			                        return { "dwdm" : node.id };
			                    }
			                }
			            }
			        });
				    $("#typeTree_"+dwmc).on('select_node.jstree', function (e, data) {
			            var nodeTxt = data.instance.get_node(data.selected[0]).text;
			            $('#'+dwmc).val(nodeTxt);
			            $('#'+dwdm).val(data.selected[0]);
			            // 所属单位选择自动生成行政区划
			            if (dwmc == "ssdwmc") {
			                // 根据所选的单位来生成行政代码
			                var parent = data.node.parent;
			                var xzqh = data.selected[0];
			                var xzqhs;
			                // 根节点
			                if (parent == "#") {
			                    //从数据库中获取截取位数
			                    var rootNumber = ${xzqh_root_number};
			                    if (xzqh.length >= rootNumber) {
			                        xzqh = xzqh.substring (0, 6);
			                        
			                    }
			                } else {
			                    // 从数据库中获取截取位数
			                    var otherNumber = ${xzqh_other_number};
			                    if (xzqh.length >= otherNumber) {
			                        xzqh = xzqh.substring (0, 6); 
			                        
			                    }
			                }
			            
			                $('#xzqh').val(xzqh);
			                xzqhs=xzqh+"000000";
			              /*   var url="<c:url value='/pubXtzd/getxzqh' />";
			                Manage.query(url, { xzqhs : xzqhs }, function(result) {
			    				if (result.statusCode == "200") {
			    					var xzqh = result.data;//获取后台数据
			    					$.each(xzqh, function(n, value) {
			    						 $('#xzqh').val(value.dwmc);
			    					
			    					});
			    				}
			    			}); */
			                
			                
			             
			            }
			            treeDiv.hide();
			        });
				}
	        
	    }});
	}
	     
		$('.chosen-select').chosen({
			no_results_text : "没有找到",
			allow_single_deselect : true//设置下拉菜单选择方式
		});
		
		//获取select文本 
		function acquire_text(select, id) {
			$(id).val($(select + " option:selected").text());
		}
		
		//加载下拉框方法
		function lodaSelect(id, url, zdbh,ryxbs) {
			Manage.query(url, { zdbh : zdbh }, function(result) {
				if (result.statusCode == "200") {
					var pubXtzds = result.data;//获取后台数据
					$.each(pubXtzds, function(n, value) {
						$("#" + id).append("<option value='"+value.zdxz+"'>" + value.zdxm + "</option>");//js生成option标签
						$("#" + id).val(ryxbs);
						$("#" + id).trigger("chosen:updated"); //更新chosen_select下拉菜单
					});
				}
			});
		}
	
	
		/*日期格式转换  */
		laydate.skin('molv');
		laydate({
			   start:'2017-02-15 00:00:00',
			   elem: '#csnys',
			   format: 'YYYY-MM-DD  00:00:00',//日期格式
				   isclear: false
			});
		
		
		
	</script>
</body>
</html>