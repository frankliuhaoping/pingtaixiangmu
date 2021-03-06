<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<%--  头部--%>
<head>
<%-- css库 --%>
<jsp:include page="/common/template/head_basic.jsp" />
<link href="<c:url value='/common/static/plugins/jstree/themes/default/style.min.css?v=3.3.1' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/common/static/plugins/switch/css/bootstrap3/bootstrap-switch.min.css' />" rel="stylesheet" type="text/css" />
</head>
<%--  主体--%>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<%-- 标题--%>
				<h5><spring:message code="pubRyxx.add" /></h5>
				<%--必填  --%>
				<span class="ibox-sub-title"><span class="fieldRequired">*</span><spring:message code="required" /></span>
			</div>
			<div class="ibox-content clearfix">
				<%-- form表单 --%>
				<form class="form-horizontal col-sm-10 col-sm-offset-1">
					<%-- 人员姓名 --%>
					<div class="form-group col-sm-6">
					     <label for="ryxm" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.ryxm" />:
                        </label>
						<div class="col-sm-9">
							<input type="text" id="ryxm" name="ryxm" class="form-control" maxlength="50" required >
						</div>
					</div>
					<%-- 人员警号 --%>
					<div class="form-group col-sm-6">
						<label for="ryjh" class="col-sm-3 control-label"><spring:message code="pubRyxx.ryjh" />: </label>
						<div class="col-sm-9">
							<input type="text" id="ryjh" name="ryjh" class="form-control"maxlength="12" digits="true">
						</div>
					</div>
					<%-- 身份证编号  --%>
					<div class="form-group col-sm-6">
						<label for="sfzbh" class="col-sm-3 control-label">
                            <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.sfzbh" />:
                        </label>
						<div class="col-sm-9">
							<input type="text" id="sfzbh" name="sfzbh" maxlength="18" sfzhmFormat="true" class="form-control" required>
						</div>
					</div>
					<%-- 人员性别 --%>
					<div class="form-group col-sm-6">
						<label for="ryxb" class="col-md-3 control-label">
						      <span class="fieldRequired">*</span>&nbsp;<spring:message code="pubRyxx.ryxb" />:
						</label>
						<div class="col-sm-9">
							<%--性别下拉框  --%>
							<select id="ryxb" name="ryxb"  class="form-control" onchange="acquire_text('#ryxb','#xbms')" required >
								<option value="">请选择人员性别...</option>
							</select>
						</div>
					</div>
					<%-- 性别描述 --%>
					<input type="text" id="xbms" name="xbms" style="display: none;">
					<%-- 出生年月 --%>
					<div class="form-group col-sm-6">
						<label for="csny" class="col-sm-3 control-label"><spring:message code="pubRyxx.csny" />: </label>
						<div class="col-sm-9" >
							<input type="text" id="csnys" name="csnys" readonly="readonly" class="form-control timebox" >
						</div>
					</div>
					<%-- 人员状态 --%>
					<div class="form-group col-sm-6">
						<label for="ryzt" class="col-md-3 control-label"><spring:message code="pubRyxx.ryzt" />:</label>
						<div class="col-sm-9">
							<%--状态下拉框  --%>
							<select id="ryzt" name="ryzt"  class="form-control" onchange="acquire_text('#ryzt','#ryztms')" >
								<option value="">请选择人员状态...</option>
							</select>
						</div>
					</div>
					<%-- 人员状态描述 --%>
					<input type="text" id="ryztms" name="ryztms" style="display: none;">
					<%-- 人员职务 --%>
					<div class="form-group col-sm-6">
						<label for="ryzw" class="col-md-3 control-label"><spring:message code="pubRyxx.ryzw" />:</label>
						<div class="col-sm-9">
							<%--职务下拉框  --%>
							<select id="ryzw" name="ryzw"  class="form-control" onchange="acquire_text('#ryzw','#zwms')">
								<option value="">请选择人员职务...</option>
							</select>
						</div>
					</div>
					<%-- 职务描述 --%>
					<input type="text" id="zwms" name="zwms" style="display: none;">
					<%--指挥中心编号--%>
                    <div class="form-group col-sm-6" >
                        <label for="zhzxbh" class="col-sm-3 control-label" ><spring:message code="pubRyxx.zhzxbh" />:</label>
                        <div class="col-sm-9" >
                       		<select class="form-control" id="zhzxbh" name="zhzxbh" >
                          		<option value ="">请选择指挥中心...</option>
                          	</select>
                        </div>
                    </div>
					<%-- 所属单位名称 --%>
					<div class="form-group col-sm-6">
						<label class="col-sm-3 control-label"><spring:message code="pubRyxx.ssdwmc" />:</label>
						<div class="col-sm-9">
							<input id="ssdwmc" name="ssdwmc" class="form-control timebox" readonly>
						</div>
					</div>
					<%-- 所属单位代码--%>
					<div class="form-group col-sm-6">
						<label for="ssdwdm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.ssdwdm" />: </label>
						<div class="col-sm-9">
							<input id="ssdwdm" name="ssdwdm" class="form-control timebox" readonly>
						</div>
					</div>
					<%-- 行政区划 --%>
					<div class="form-group col-sm-6">
						<label for="xzqh" class="col-md-3 control-label"><spring:message code="pubRyxx.xzqh" />:</label>
						<div class="col-sm-9">
							<input id="xzqh" name="xzqh" class="form-control timebox" readonly>
						</div>
					</div>
		
					<%-- 警务通号码 --%>
					<div class="form-group col-sm-6">
						<label for="jwthm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.jwthm" />: </label>
						<div class="col-sm-9">
							<input type="text" id="jwthm" name="jwthm" digits='true' maxlength="11" class="form-control" >
						</div>
					</div>
					<%-- 电话号码 --%>
					<div class="form-group col-sm-6">
						<label for="dhhm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.dhhm" />: </label>
						<div class="col-sm-9"  id="divdhhm" name= "divdhhm" >
							<input type="text" id="dhhm" name="dhhm" style="display: none;" >
							<button type="button"   class="btn btn-default col-sm-3" onclick="inputadd('divdhhm','dhhmnum','请输入电话号码...')"> 添加电话</button>
						</div>
					</div>
					<%-- 电台号码 --%>
					<div class="form-group col-sm-6">
						<label for="dthm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.dthm" />: </label>
						<div class="col-sm-9" id="divdthm" name="divdthm" >
							<input type="text" id="dthm" name="dthm" style="display: none;">
							<button type="button"   class="btn btn-default col-sm-3" onclick="inputadd('divdthm','dthmnum','请输入电台号码...')"> 添加电台</button>
						</div>
					</div>
					<%-- 邮件地址 --%>
					<div class="form-group col-sm-6" >
						<label for="yjdz" class="col-sm-3 control-label"> <spring:message code="pubRyxx.yjdz" />: </label>
						<div class="col-sm-9">
							<input type="text" id="yjdz" name="yjdz"  email="true" class="form-control" >
						</div>
					</div>
					<%--人员住址 --%>
					<div class="form-group col-sm-6"  >
						<label for="ryzz" class="col-sm-3 control-label"> <spring:message code="pubRyxx.ryzz" />: </label>
						<div class="col-sm-9">
							<input type="text" id="ryzz" name="ryzz" class="form-control"  maxLength="64">
						</div>
					</div>
					<%-- 排序代码 --%>
					<div class="form-group col-sm-6" >
						<label for="pxdm" class="col-sm-3 control-label"> <spring:message code="pubRyxx.pxdm" />: </label>
						<div class="col-sm-9">
							<input type="text" id="pxdm" name="pxdm" class="form-control" value="0" onblur="if('' == this.value) this.value = 0" digits="true">
						</div>
					</div>
					<%--使用标志 --%>
					<div class="form-group col-sm-6">
						<label for="sybz" class="col-sm-3 control-label"><spring:message code="pubRyxx.sybz" />:</label>
						<div class="col-sm-9">
							<input type="checkbox" id="sybz_checkbox" />
						</div>
						<input type="hidden" name="sybz" id="sybz" value="Y">
					</div>
					<%-- 按钮组 --%>
					<div class="form-group">
						<div class="col-sm-12" style="text-align:center;">
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

	<%-- 引入js架包 --%>
	<jsp:include page="/common/template/script_basic.jsp" />
	<jsp:include page="/common/template/script_validate.jsp" />
	<script type="text/javascript" src="<c:url value='/common/static/js/dropdown.js' />"></script>
	<script type="text/javascript" src="<c:url value='/common/static/plugins/switch/js/bootstrap-switch.min.js' />"></script>
	<script src="<c:url value='/common/static/plugins/laydate/laydate.js' />" type="text/javascript"></script>
	<script src="<c:url value='/common/static/plugins/jstree/jstree.min.js?v=3.3.1' />" type="text/javascript"></script>
	<%-- js代码块 --%>
	<script type="text/javascript">
		$(function() {
			
			zhbzxSelect("zhzxbh","<c:url value='/jcjZhzxpzxx/getZhzxList' />");//加载指挥中心编号下拉框		
			lodaSelect("ryxb","<c:url value='/getPubXtzdList' />","system_xb");//人员性别下拉框
			lodaSelect("ryzt","<c:url value='/getPubXtzdList' />","system_ryzt");//人员状态下拉框
			lodaSelect("ryzw","<c:url value='/getPubXtzdList' />","system_ryzw");//人员职务下拉框	
			
			//加载所属单位目录树
			$("#ssdwmc").focus(function() {
				loadTree('ssdwmc','ssdwdm');
			});
			
			//使用标志事件
			Manage.validate();
			$("#sybz_checkbox").bootstrapSwitch({
				state : true,// 默认设置为启用
				onText : '<spring:message code="enable" />',//启用
				offText : '<spring:message code="disable" />',//禁用
				onColor : 'success',//设置启用标志颜色
				offColor : 'danger',//设置禁用标志颜色
				onSwitchChange : function(event, state) {
					$('#sybz').val(state ? 'Y' : 'N');
				}
			});
			
			//保存
			$('#saveBtn').click(function(){
				getdhhmvalue();
				getdthmvalue();
         		ManageForm.submitForm($('form'), "<c:url value='/pubRyxx/saveAdd'/>", {submitFun:function(){$('#cancelBtn').click();}});    
 			});
			
			//取消
			$('#cancelBtn').click(function() {
				//父类(index主页)先刷新子页在关闭，顺序不可变
		    	parent.refreshTable();
		    	parent.closeLayer();
			});	
		});
		
		//select text获取及设置
		function acquire_text(select, id) {
			$(id).val($(select + " option:selected").text());
		}
		
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
		
		// 构建下拉框树
		var treeDiv;
		// 树形下拉框加载标志，如果加载过就不要执行jstree构建
	    var treeLoadFlag = false;
		// 获取所属单位目录树 
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
		
		/* 时间格式设置 */
		laydate.skin('molv');
		laydate({
			elem : '#csnys',
			format : 'YYYY-MM-DD  00:00:00'
		});
	
		 //电话行数计数器
		 var dhhmcounter=0;
		//电台行数计数器
		 var dthmcounter=0;
		//添加一行
        function inputadd(id,ids,placeholder) {
			 if (id=="divdhhm" && dhhmcounter <= 4) {
				 dhhmcounter++;
				 var content="<div style='padding:3px 0 0;position:relative' class='col-sm-12'>";
  	             content+="<input type='text'  maxLength='15' haoge='true' class='form-control' id='"+ids+"' name='"+ids+"' placeholder='"+placeholder+"'><i class='fa fa-trash floatfa' onclick='inputremove(this,1)'></i>";
           	     content+="</div>";
			}
			 if (id=="divdthm" && dthmcounter <= 4) {
				dthmcounter++;
				var content="<div style='padding:3px 0 0;position:relative' class='col-sm-12'>";
 	             	content+="<input type='text' maxLength='16' digits='true'  class='form-control' id='"+ids+"' name='"+ids+"' placeholder='"+placeholder+"'><i class='fa fa-trash floatfa' onclick='inputremove(this,2)'></i>";
          	     	content+="</div>";
			}
			$("#"+id).append(content);	
        }	
        //删除当前行
        function inputremove(obj,id) {  
        	$(obj).parent().remove();
        	if (id=="1") {
        		dhhmcounter--;
			}if (id=="2") {
				dthmcounter--;
			}
        }
        
      var dhhmvalue ="";
      var dthmvalue ="";
        //电话号码拼接
      function getdhhmvalue(){	
		$("#divdhhm input[name='dhhmnum']").each(function () {
			dhhmvalue = dhhmvalue+$(this).val()+",";
		});
		$("#dhhm").val(dhhmvalue.substring(0,dhhmvalue.length-1)); 
		
      }
        //电台号码拼接
      function getdthmvalue(){	
		$("#divdthm input[name='dthmnum']").each(function () {
		dthmvalue = dthmvalue+$(this).val()+",";
		});
		$("#dthm").val(dthmvalue.substring(0,dthmvalue.length-1)); 
      }
        
    //加载指挥中心下拉框方法
  	function zhbzxSelect(id, url) {
  		Manage.query(url, null, function(result) {
  			if (result.statusCode == "200") {
  				var zhzxs = result.data;//获取后台数据
  				$.each(zhzxs, function(n, value) {
  					$("#" + id).append("<option value='"+value.zhzxbh+"'>" + value.zhzxmc+ "</option>");//js生成option标签
  					$("#" + id).trigger("chosen:updated"); //更新chosen_select下拉菜单

  				});
  			}
  		});
  	}  
        
	</script>
</body>
</html>