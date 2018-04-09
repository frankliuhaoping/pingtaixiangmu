<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<!-- 头部 -->
<head>
<!-- css库 -->
<jsp:include page="/common/template/head_basic.jsp" />
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>
<!--主体  -->
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<!-- 标题 -->
				<h5><spring:message code="pubJqxz.view" /></h5>
			</div>
			<div class="ibox-content">
				<!--form表单  -->
				<form class="form-horizontal formW60p">
					<!-- 警情性质编号 -->
					<div class="form-group">
						<label for="jqxzbh" class="col-sm-3 control-label"><spring:message code="pubJqxz.jqxzbh" />: </label>
						<div class="col-sm-9">
							<input id="jqxzbh" name="jqxzbh" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!-- 警情性质简称 -->
					<div class="form-group">
						<label for="jqxzjc" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jqxzjc" />: </label>
						<div class="col-sm-9">
							<input id="jqxzjc" name="jqxzjc" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!-- 警情性质拼音码 -->
					<div class="form-group">
						<label for="jqxzjcpym" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jqxzjcpym" />: </label>
						<div class="col-sm-9">
							<input id="jqxzjcpym" name="jqxzjcpym" class="form-control" readonly="readonly">
						</div>
					</div>
                 	<!-- 警情性质全称 -->
					<div class="form-group">
						<label for="jqxzqc" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jqxzqc" />: </label>
						<div class="col-sm-9">
							<input id="jqxzqc" name="jqxzqc" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!-- 标准警情性质编号 -->
					<div class="form-group">
						<label for="bzjqxzbh" class="col-sm-3 control-label"> <spring:message code="pubJqxz.bzjqxzbh" />: </label>
						<div class="col-sm-9">
							<input id="bzjqxzbh" name="bzjqxzbh" class="form-control" readonly="readonly">
						</div>
					</div>
                    <!-- 标准警情性质名称 -->
					<div class="form-group">
						<label for="bzjqxzmc" class="col-sm-3 control-label"> <spring:message code="pubJqxz.bzjqxzmc" />: </label>
						<div class="col-sm-9">
							<input id="bzjqxzmc" name="bzjqxzmc" class="form-control" readonly="readonly">
						</div>
					</div>
					<!--数据来源描述  -->
					<div class="form-group">
						<label for="sjlyms" class="col-sm-3 control-label"> 数据来源描述: </label>
						<div class="col-sm-9">
							<input id="sjlyms" name="sjlyms" class="form-control" readonly="readonly" >
						</div>
					</div>
					
					<!--数据来源代码  -->
					<div class="form-group">
						<label for="sjlydm" class="col-sm-3 control-label"> 数据来源代码: </label>
						<div class="col-sm-9">
							<input id="sjlydm" name="sjlydm" class="form-control" readonly="readonly" >
						</div>
					</div>
                   	<!-- 警情性质预案地址 -->
					<div class="form-group">
						<label for="jqxzyaurl" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jqxzyaurl" />: </label>
						<div class="col-sm-9">
							<input id="jqxzyaurl" name="jqxzyaurl" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!-- 旧警情性质代码 -->
					<div class="form-group">
						<label for="jjqxzdm" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jjqxzdm" />: </label>
						<div class="col-sm-9">
							<input id="jjqxzdm" name="jjqxzdm" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!-- 旧警情性质名称 -->
					<div class="form-group">
						<label for="jjqxzmc" class="col-sm-3 control-label"> <spring:message code="pubJqxz.jjqxzmc" />: </label>
						<div class="col-sm-9">
							<input id="jjqxzmc" name="jjqxzmc" class="form-control" readonly="readonly">
						</div>
					</div>
                   	<!--排序代码 -->
					<div class="form-group">
						<label for="pxdm" class="col-sm-3 control-label"> <spring:message code="pubJqxz.pxdm" />: </label>
						<div class="col-sm-9">
							<input id="pxdm" name="pxdm" class="form-control" readonly="readonly">
						</div>
					</div>
                  	<!-- 数据版本 -->
					<div class="form-group">
						<label for="sjbb" class="col-sm-3 control-label"> <spring:message code="pubJqxz.sjbb" />: </label>
						<div class="col-sm-9">
							<input id="sjbb" name="sjbb" class="form-control" readonly="readonly">
						</div>
					</div>
                  	<!-- 创建时间 -->
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="pubJqxz.cjsj" />:</label>
						<div class="col-sm-9">
							<input readonly="readonly" class="form-control" id="cjsj" name="cjsj" readonly="readonly" />
						</div>
					</div>
                         <!-- 创建人姓名 -->
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="pubJqxz.cjrxm" />:</label>
						<div class="col-sm-9">
							<input readonly="readonly" class="form-control" id="cjrxm" name="cjrxm" readonly="readonly" />
						</div>
					</div>
                   	<!-- 更新时间 -->
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="pubJqxz.gxsj" />:</label>
						<div class="col-sm-9">
							<input readonly="readonly" class="form-control" id="gxsj" name="gxsj" readonly="readonly" />
						</div>
					</div>
                    <!-- 更新人姓名 -->
					<div class="form-group">
						<label class="col-sm-3 control-label"><spring:message code="pubJqxz.gxrxm" />:</label>
						<div class="col-sm-9">
							<input readonly="readonly" class="form-control" id="gxrxm" name="gxrxm" readonly="readonly" />
						</div>
					</div>
					<!-- 110用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz110" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz110_checkbox" readonly="readonly" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz110" id="yhsybz110" value="Y"> -->
<!-- 					</div> -->
					<!--122用户使用标志  -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz122" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz122_checkbox"readonly="readonly"  /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz122" id="yhsybz122" value="Y"> -->
<!-- 					</div> -->
					<!-- 120用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz120" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz120_checkbox" readonly="readonly" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz120" id="yhsybz120" value="Y"> -->
<!-- 					</div> -->
					<!-- 119用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.yhsybz119" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="yhsybz119_checkbox" readonly="readonly" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="yhsybz119" id="yhsybz119" value="Y"> -->
<!-- 					</div> -->
					<!-- 其他用户使用标志 -->
<!-- 					<div class="form-group "> -->
<%-- 						<label class="col-sm-3 control-label"><spring:message --%>
<%-- 								code="pubJqxz.qtyhsybz" />:</label> --%>
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="checkbox" id="qtyhsybz_checkbox" readonly="readonly" /> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="qtyhsybz" id="qtyhsybz" value="Y"> -->
<!-- 					</div> -->
                   	<!-- 使用标志 -->
					<div class="form-group">
						<label for="sybz" class="col-sm-3 control-label"><spring:message code="pubJqxz.sybz" />:</label>
						<div class="col-sm-9">
							<input type="checkbox" readonly="readonly" id="sybz_checkbox" />
						</div>
						<input type="hidden" name="sybz" id="sybz">
					</div>
                  	<!-- 返回 -->
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="button" class="btn btn-default" id="backBtn"><i class="fa fa-reply-all"></i>&nbsp;<spring:message code="back" />
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- js库 -->
	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/common/static/js/moment.min.js' />"></script>
	<script type="text/javascript">
		$(function() {
         	
            // 初始化数据
			var pubJqxz = ${pubJqxz};
			ManageForm.loadForm($('form'), pubJqxz);
            // 使用标志 
			var sybztate = 'Y' == pubJqxz.sybz ? true : false;
			$("#sybz_checkbox").bootstrapSwitch({
				state : sybztate,
				onText : '<spring:message code="enable" />',
				offText : '<spring:message code="disable" />',
				onColor : 'success',
				offColor : 'danger',
				onSwitchChange : function(event, state) {
					$('#sybz').val(state ? 'Y' : 'N');
				}
			});
			
			//110用户使用标志
		    var yhsybz110state = 'Y' ==  pubJqxz.yhsybz110 ? true : false;
		    $("#yhsybz110_checkbox").bootstrapSwitch({
		    	state:yhsybz110state,
		        onText : '<spring:message code="enable" />',
		        offText : '<spring:message code="disable" />',
		        onColor:'success',
		        offColor:'danger',
		        onSwitchChange:function(event, state){
		        	$('#yhsybz110').val(state ? 'Y' : 'N');
		        }
		    });
		    //122用户使用标志
		    var yhsybz122state = 'Y' == pubJqxz.yhsybz122 ? true : false;
		    $("#yhsybz122_checkbox").bootstrapSwitch({
		    	state:yhsybz122state,
		        onText : '<spring:message code="enable" />',
		        offText : '<spring:message code="disable" />',
		        onColor:'success',
		        offColor:'danger',
		        onSwitchChange:function(event, state){
		        	$('#yhsybz122').val(state ? 'Y' : 'N');
		        }
		    });
		    //120用户使用标志
		    var yhsybz120state = 'Y' == pubJqxz.yhsybz120 ? true:false;
		    $("#yhsybz120_checkbox").bootstrapSwitch({
		    	state:yhsybz120state,
		        onText : '<spring:message code="enable" />',
		        offText : '<spring:message code="disable" />',
		        onColor:'success',
		        offColor:'danger',
		        onSwitchChange:function(event, state){
		        	$('#yhsybz120').val(state ? 'Y' : 'N');
		        }
		    });
		    //119用户使用标志
		    var yhsybz119state = 'Y' == pubJqxz.yhsybz119 ? true : false;
		    $("#yhsybz119_checkbox").bootstrapSwitch({
		    	state:yhsybz119state,
		        onText : '<spring:message code="enable" />',
		        offText : '<spring:message code="disable" />',
		        onColor:'success',
		        offColor:'danger',
		        onSwitchChange:function(event, state){
		        	$('#yhsybz119').val(state ? 'Y' : 'N');
		        }
		    });
		    //其它用户使用标志
		    var qtyhsybzstate = 'Y' == pubJqxz.qtyhsybz ? true :false;
		    $("#qtyhsybz_checkbox").bootstrapSwitch({
		    	state:qtyhsybzstate,
		        onText : '<spring:message code="enable" />',
		        offText : '<spring:message code="disable" />',
		        onColor:'success',
		        offColor:'danger',
		        onSwitchChange:function(event, state){
		        	$('#qtyhsybz').val(state ? 'Y' : 'N');
		        }
		    });
			
			//加载用户使用标志
			interpretBz(pubJqxz.yhsybz110,"yhsybz110");
			interpretBz(pubJqxz.yhsybz122,"yhsybz122");
			interpretBz(pubJqxz.yhsybz120,"yhsybz120");
			interpretBz(pubJqxz.yhsybz119,"yhsybz119");
			interpretBz(pubJqxz.qtyhsybz,"qtyhsybz");

			// 创建时间格式转换 
			var cjsj = pubJqxz.cjsj;
			if (cjsj != null && cjsj != '') {
				$('#cjsj').val(moment(cjsj).format('YYYY-MM-DD HH:mm:ss'));
			}
			//更新时间格式转换 
			var gxsj = pubJqxz.gxsj;
			if (gxsj != null && gxsj != '') {
				$('#gxsj').val(moment(gxsj).format('YYYY-MM-DD HH:mm:ss'));
			}
			
			// 返回 
			$('#backBtn').click(function() {
				//父类(index主页)关闭刷新
		    	parent.closeLayer();
		    	parent.refreshTable();
			});

		});
		//用户标志翻译
		function interpretBz(bz,id){
			if (bz=='Y') {
				$("#"+id).val("启用");
			}if(bz=='N'){
				$("#"+id).val("禁用");
			}
		}
		
	</script>
</body>
</html>