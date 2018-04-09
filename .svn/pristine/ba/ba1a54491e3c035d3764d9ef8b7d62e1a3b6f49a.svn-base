<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/common/template/head_basic.jsp" />
    <link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>
                    <spring:message code="pubUser.add" />
                    <span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
                </h5>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal formW60p">
                     <div class="form-group">
                        <label for="yhzh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.yhzh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="yhzh" name="yhzh" class="form-control" required maxlength="32"  yhzhFormat="true">
                          	<!-- 验证帐号-->
<%--                             <input type="text" id="yhzh" name="yhzh" class="form-control" required maxlength="32" remote="<c:url value='/pubUser/validateYhzh' />" yhzhFormat="true"> --%>
                        </div>
                    </div>
                    <%-- 用户名称输入时获取关联的信息 begin --%>
					<div class="form-group">
						<label for="yhmc" class="col-sm-3 control-label"><span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.yhmc" />:</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input type="text" id="yhmc" name="yhmc" class="form-control" 
									required maxlength="8" >
								
								<div class="input-group-btn" style="width:0.1px;height:0.1px">
									<button type="button" class="btn btn-white dropdown-toggle"
										data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
								</div>
							</div>
						</div>
						<input type=hidden id="rybh" name="rybh">	
					</div>
					<%-- 用户名称输入时获取关联的信息 end --%>
					<div class="form-group">
                        <label for="ssdwmc" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubUser.ssdwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="ssdwmc" name="ssdwmc" class="form-control timebox" required readonly="readonly" maxlength="20">
                        </div>
                        <input type="hidden" id="ssdwdm" name="ssdwdm">
                    </div>
                    <div class="form-group">
                        <label for="dldwmc" class="col-sm-3 control-label">
                            <spring:message code="pubUser.dldwmc" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="dldwmc" name="dldwmc" class="form-control timebox"  readonly="readonly" maxlength="20">
                        </div>
                        <input type="hidden" id="dldwdm" name="dldwdm">
                    </div>
                    <div class="form-group">
                        <label for="xzqh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.xzqh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="xzqh" name="xzqh" class="form-control timebox"  readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pkiid" class="col-sm-3 control-label">
                            <spring:message code="pubUser.pkiid" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pkiid" name="pkiid" class="form-control"  maxlength="32" noChinese="ture">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lxdh" class="col-sm-3 control-label">
                            <spring:message code="pubUser.lxdh" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="lxdh" name="lxdh" class="form-control"  maxlength="64" contact="true">
                        </div>
                    </div>
                    <!-- digits="true"改成pxdmFormat="true" -->
                    <div class="form-group">
                        <label for="pxdm" class="col-sm-3 control-label">
                            <spring:message code="pxdm" />:
                        </label>
                        <div class="col-sm-9">
                            <input type="text" id="pxdm" name="pxdm" class="form-control"  value="0" maxlength="8" digits="true" onblur="if('' == this.value) this.value = 0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sybz" class="col-sm-3 control-label"><spring:message code="pubUser.sybz" />:</label>
                        <div class="col-sm-9">
                        	<input type="checkbox" id="sybz_checkbox"/>
                        </div>
                        <input type="hidden" name="sybz" id="sybz" value="Y">
                    </div>
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
    
<jsp:include page="/common/template/script_validate.jsp" />
<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
<script src="<c:url value='/common/static/plugins/bootstrap-suggest/js/bootstrap-suggest.min.js' />" type="text/javascript"></script>
<script type="text/javascript">

var pubRyxxUrl = {
	getDataByPage : "<c:url value='/pubRyxx/getDataByPage' />"/* 分页查询 */
};
	
$(function () {
	
	Manage.validate();
	 
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
    
    $('#saveBtn').click(function(){
        ManageForm.submitForm($('form'), "<c:url value='/pubUser/saveAdd' />", {submitFun:function(){$('#cancelBtn').click();}});
    });
    
    $('#cancelBtn').click(function(){
    	//父类(index主页)先刷新子页在关闭，顺序不可变
    	parent.refreshTable();
    	parent.closeLayer();
    });
    
    $("#ssdwmc").focus(function() {
    	loadTree('ssdwmc','ssdwdm');
    });
    
    $("#dldwmc").focus(function() {
    	loadTree('dldwmc','dldwdm');
    });
    
  //用户名称输入首字母时加载人员信息表提供关联的信息，参数设定名称，值自动赋值&ryxm=
    var testdataBsSuggest = $("#yhmc").bsSuggest({
    	    url:pubRyxxUrl.getDataByPage + "?limit=6&offset=0&ryxm=",
            indexId: 2,                       //data.value 的第二个字段加入到input中
            indexKey: 1,                      //data.value 的第几个数据，作为input输入框的内容
            idField: 'rybh',                  //每组数据的哪个字段作为 data-id，优先级高于 indexId 设置（推荐）
            keyField: 'ryxm',                 //每组数据的哪个字段作为输入框内容，优先级高于 indexKey 设置（推荐）
            autoSelect: true,                 //键盘向上/下方向键时，是否自动选择值
            allowNoKeyword: true,
            keyEnter: 13,                    //回车键
            ignorecase: true,                 //忽略大小写 
            showHeader: false,                //显示 header 
            showBtn: false,                   //不显示下拉按钮 
            getDataMethod: "Url",             //获取数据的方式，总是从 URL 获取 
            showHeader: true,                 //显示多个字段的表头  
            twoWayMatch: true,                // 是否双向匹配搜索。为 true 即输入关键字包含或包含于匹配字段均认为匹配成功，为 false 则输入关键字包含于匹配字段认为匹配成功
            inputWarnColor: "#ffffff",        //下拉时input警告颜色
            effectiveFields: ['ryxm','ssdwmc','sfzbh','xbms'], //控制需要显示的字段
            effectiveFieldsAlias:{ ryxm: "人员姓名",ssdwmc:'所属单位名称',sfzbh:'身份证号码',xbms:'性别'},//字段别名
           //sjsonp: 'callback',              //如果从 url 获取数据，并且需要跨域，则该参数必须设置 ,不跨域则不能设置，不然数据处理不能接受数据 
            processData: function (json) {    // url 获取数据时，对数据的处理，作为 getData 的回调函数  
               var  data = {value: []};  
               //判断返回值是否为空
               if(!json || !json.rows || json.rows.length == 0) {  
                   return false;  
               }  
               //不为空则添加到data中
               data.value=json.rows; 
               return data;  
            }
        }) //用户选择事件，选择时将从人员表选择的信息编号添加到隐藏的input中传递
        .on('onSetSelectValue', function (e, result) {
            $('#rybh').val(result.id);
        })//取消选择值，清空隐藏input的值
        .on('onUnsetSelectValue', function (e) {
            $('#rybh').val('');
        });
});

// 构建下拉框树
var treeDiv;
//树形下拉框加载标志，如果加载过就不要执行jstree构建
var treeLoadFlag ={ 
	ssdwmctreeLoadFlag : false,
    dldwmctreeLoadFlag : false
};
//加载树形单位菜单
function loadTree(dwmc, dwdm){
    treeDiv = Public.dropdown($("#"+dwmc), '<div id="typeTree_'+dwmc+'" style="padding: 10px;"></div>', {onShow:function(){
    	//判断两者其中之一如果取反为true则进行加载
    	if (!treeLoadFlag.ssdwmctreeLoadFlag || !treeLoadFlag.dldwmctreeLoadFlag) {
    		//如果取反为true则赋值为true,只加载一次就够了。下一次就不会进来了
    		if(!treeLoadFlag.ssdwmctreeLoadFlag){
    			treeLoadFlag.ssdwmctreeLoadFlag = true;
    		}else if(!treeLoadFlag.dldwmctreeLoadFlag){
    			treeLoadFlag.dldwmctreeLoadFlag = true;
    		}
    		
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
	                // 根节点
	                if (parent == "#") {
	                    //从数据库中获取截取位数
	                    var rootNumber = ${xzqh_root_number};
	                    if (xzqh.length >= rootNumber) {
	                        xzqh = xzqh.substring (0, rootNumber);
	                    }
	                } else {
	                    // 从数据库中获取截取位数
	                    var otherNumber = ${xzqh_other_number};
	                    if (xzqh.length >= otherNumber) {
	                        xzqh = xzqh.substring (0, otherNumber);
	                    }
	                }
	                $('#xzqh').val(xzqh);
	            }
	            treeDiv.hide();
	        });
    	}
        
    }});
}

</script>
</body>
</html>