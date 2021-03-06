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
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />"
	rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>
					<spring:message code="pubZzjg.edit" />
					<span class="ibox-sub-title"><span class="fieldRequired">*</span>
						<spring:message code="required" /></span>
				</h5>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal row label-title">
					<div class="col-sm-12">
					    <%-- 第一行  begin --%>
						<div class="row">
							<input name="sjbb" type="hidden">
							<div class="form-group col-sm-4">
								<label for="gxdwjc" class="col-sm-4 control-label"> <span
									class="fieldRequired">*</span>&nbsp;<spring:message
										code="pubZzjg.gxdwjc" />:
								</label>
								<div class="col-sm-8">
									<input id="gxdwjc" name="gxdwjc" class="form-control timebox" readonly required maxLength="32">
								</div>
							</div>
							
							<div class="form-group col-sm-4">
								<label for="gxdwdm" class="col-sm-4 control-label"> <span
									class="fieldRequired">*</span>&nbsp;<spring:message
										code="pubZzjg.gxdwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="gxdwdm" name="gxdwdm" class="form-control timebox" readonly>
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dwmc" class="col-sm-4 control-label"> <span
									class="fieldRequired">*</span>&nbsp;<spring:message
										code="pubZzjg.dwmc" />:
								</label>
								<div class="col-sm-8">
									<input id="dwmc" name="dwmc" class="form-control"
										 required  maxLength="64">
								</div>
							</div>
						</div>
                        <%-- 第一行  end --%>
                        
                        <%-- 第二行  begin --%>
						<div class="row">
								<div class="form-group col-sm-4">
								<label for="dwdm" class="col-sm-4 control-label"> <span
									class="fieldRequired">*</span>&nbsp;<spring:message
										code="pubZzjg.dwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="dwdm" name="dwdm" class="form-control timebox"
									required readonly maxLength="12" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dwjc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dwjc" />:
								</label>
								<div class="col-sm-8">
									<input id="dwjc" name="dwjc" class="form-control"
										
										maxLength="32">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jcpym" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jcpym" />:
								</label>
								<div class="col-sm-8">
									<input id="jcpym" name="jcpym" class="form-control"
										
										maxLength="70" noChinese="true">
								</div>
							</div>
						</div>
						<%-- 第二行  end --%>
						
                        <%-- 第三行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="dhhm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dhhm" />:
								</label>
								<div class="col-sm-8">
									<input id="dhhm" name="dhhm" class="form-control"
										
										maxLength="256" manyMobiles="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="czhm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.czhm" />:
								</label>
								<div class="col-sm-8">
									<input id="czhm" name="czhm" class="form-control"
										
										maxLength="256" manyMobiles="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dthm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dthm" />:
								</label>
								<div class="col-sm-8">
									<input id="dthm" name="dthm" class="form-control"
										
										maxLength="256" amount="true">
								</div>
							</div>
						</div>
						<%-- 第三行  end --%>

                        <%-- 第四行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="yjdz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.yjdz" />:
								</label>
								<div class="col-sm-8">
									<input id="yjdz" name="yjdz" class="form-control"
										
										maxLength="256" email="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jhdwdm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jhdwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="jhdwdm" name="jhdwdm" class="form-control"
										
										maxLength="32" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jhdwmc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jhdwmc" />:
								</label>
								<div class="col-sm-8">
									<input id="jhdwmc" name="jhdwmc" class="form-control"
										
										maxLength="64">
								</div>
							</div>
						</div>
						<%-- 第四行  end --%>

                        <%-- 第五行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="dwlb" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dwlb" />:
								</label>
								<div class="col-sm-8">
									<input id="dwlb" name="dwlb" class="form-control"
										
										maxLength="2" noChinese="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dwlbms" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dwlbms" />:
								</label>
								<div class="col-sm-8">
									<input id="dwlbms" name="dwlbms" class="form-control"
										
										maxLength="16">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dwjb" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dwjb" />:
								</label>
								<div class="col-sm-8">
									<input id="dwjb" name="dwjb" class="form-control"
										
										maxLength="8">
								</div>
							</div>
						</div>
						<%-- 第五行  end --%>

                        <%-- 第六行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="tjbz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.tjbz" />:
								</label>
								<div class="col-sm-8">
									<input id="tjbz" name="tjbz" class="form-control"
										>
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="zz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.zz" />:
								</label>
								<div class="col-sm-8">
									<input id="zz" name="zz" class="form-control"
										>
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="slms" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.slms" />:
								</label>
								<div class="col-sm-8">
									<input id="slms" name="slms" class="form-control"
										
										maxLength="512">
								</div>
							</div>
						</div>
						<%-- 第六行  end --%>

                        <%-- 第七行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="dcsc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dcsc" />:
								</label>
								<div class="col-sm-8">
									<input id="dcsc" name="dcsc" class="form-control"
										
										maxLength="2" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="kjjz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.kjjz" />:
								</label>
								<div class="col-sm-8">
									<input id="kjjz" name="kjjz" class="form-control"
										
										maxLength="12" noChinese="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jbdwbz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jbdwbz" />:
								</label>
								<div class="col-sm-8">
									<input id="jbdwbz" name="jbdwbz" class="form-control"
										
										maxLength="2" noChinese="true">
								</div>
							</div>
						</div>
					    <%-- 第七行  end --%>

                        <%-- 第八行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="dwdz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dwdz" />:
								</label>
								<div class="col-sm-8">
									<input id="dwdz" name="dwdz" class="form-control"
										
										maxLength="64">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jdwdm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jdwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="jdwdm" name="jdwdm" class="form-control"
										
										maxLength="12" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="jdwmc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.jdwmc" />:
								</label>
								<div class="col-sm-8">
									<input id="jdwmc" name="jdwmc" class="form-control"
										
										maxLength="32">
								</div>
							</div>
						</div>
						<%-- 第八行  end --%>

                        <%-- 第九行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="zgdwdm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.zgdwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="zgdwdm" name="zgdwdm" class="form-control"
										
										maxLength="12" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="zgdwmc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.zgdwmc" />:
								</label>
								<div class="col-sm-8">
									<input id="zgdwmc" name="zgdwmc" class="form-control"
										
										maxLength="64">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="xgbz" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.xgbz" />:
								</label>
								<div class="col-sm-8">
									<input id="xgbz" name="xgbz" class="form-control"
										
										maxLength="64">
								</div>
							</div>
						</div>
						<%-- 第九行  end --%>

                        <%-- 第十行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="dldwdm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dldwdm" />:
								</label>
								<div class="col-sm-8">
									<input id="dldwdm" name="dldwdm" class="form-control"
										
										maxLength="12" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="dldwmc" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.dldwmc" />:
								</label>
								<div class="col-sm-8">
									<input id="dldwmc" name="dldwmc" class="form-control"
										
										maxLength="64">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="xzb" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.xzb" />:
								</label>
								<div class="col-sm-8">
									<input id="xzb" name="xzb" class="form-control"
										>
								</div>
							</div>
						</div>
						<%-- 第十行  end --%>

                        <%-- 第十一行  begin --%>
						<div class="row">
							<div class="form-group col-sm-4">
								<label for="yzb" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.yzb" />:
								</label>
								<div class="col-sm-8">
									<input id="yzb" name="yzb" class="form-control"
										>
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="pxdm" class="col-sm-4 control-label"> <spring:message
										code="pubZzjg.pxdm" />:
								</label>
								<div class="col-sm-8">
									<input id="pxdm" name="pxdm" class="form-control"
										
										maxLength="8" digits="true">
								</div>
							</div>

							<div class="form-group col-sm-4">
								<label for="sybz" class="col-sm-4 control-label"><spring:message
										code="pubZzjg.sybz" />: </label>
								<div class="col-sm-8">
									<input type="checkbox" id="sybz_checkbox" />
								</div>
								<input type="hidden" name="sybz" id="sybz" value="Y">
							</div>
						</div>
						<%-- 第十一行  end --%>
						<div class="form-group col-sm-12">
							<div class="col-sm-12" style="text-align:center;">
								<button type="button" class="btn btn-primary" id="saveBtn">
									<i class="fa fa-check"></i>&nbsp;&nbsp;
									<spring:message code="determine" />
								</button>
								<button type="button" class="btn btn-default" id="cancelBtn">
									<i class="fa fa-close"></i>&nbsp;&nbsp;
									<spring:message code="cancel" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script type="text/javascript">
$(function () {
	//初始化表单验证
	Manage.validate();
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubZzjg/saveEdit' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    $('#cancelBtn').click(function(){
    	if(parseInt(parent.page) == 0)
    	{
    		//父类(index主页)先刷新子页在关闭，顺序不可变
	    	parent.refreshTable();
	    	parent.closeLayer();
    	}
    	if(parseInt(parent.page) == 1)
    	{
    		parent.$('#myResTab').find('li').eq(1).click();
    		parent.closeLayer();
    	}
    });
    
    //单位简称文本框获取焦点加载树形数据
    $("#gxdwjc").focus(function() {
    	loadTree();
    });
    

    var pubZzjg = ${pubZzjg};
    ManageForm.loadForm($('form'), pubZzjg);
    
    var sybztate = 'Y' == pubZzjg.sybz ? true : false;
    $("#sybz_checkbox").bootstrapSwitch({
    	state:sybztate,
        onText : '<spring:message code="enable" />',
        offText : '<spring:message code="disable" />',
        onColor:'success',
        offColor:'danger',
        onSwitchChange:function(event, state){
        	$('#sybz').val(state ? 'Y' : 'N');
        }
    });
    
    
    var treeDiv;
    // 树形下拉框加载标志，如果加载过就不要执行jstree构建
    var treeLoadFlag = false;
    function loadTree() {
    treeDiv = Public.dropdown($("#gxdwjc"), '<div id="typeTree" style="padding: 10px;"></div>', {onShow:function(){
    	if (!treeLoadFlag) {
            treeLoadFlag = true;
   	    	$("#typeTree").jstree({
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
   	    	
   	    	$("#typeTree").on('select_node.jstree', function (e, data) {
   	            var nodeTxt = data.instance.get_node(data.selected[0]).text;
   	            $('#gxdwjc').val(nodeTxt);
   	            treeDiv.hide();
   	            
   	             var dwdm = data.selected[0];
   	            // dwdm == -1  表示区分不限组织机构选择
   	            if(dwdm == '-1'){
   	            	$("#gxdwdm").val('');
   	            }else{
   	            	 $("#gxdwdm").val(dwdm);
   	            }
   	            
   	        });
    	}
    	   
    }});
    }
    
});

</script>
</body>
</html>