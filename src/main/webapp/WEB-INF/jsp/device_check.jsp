<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>

<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<!-- singleSelect:true, -->
<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<table id="deviceCheck" title="�豸����" style="height:389px"  
	data-options="
	   rownumbers:true,
	   toolbar:'#toobar_deviceCheck',
	   url:'json/deviceCheck_All.json',
	   method:'get',
	   pagination:true,
	   pageSize:10,
	   pageList:[10, 20, 30], 
	   remoteSort:false,
	   multiSort:true,
	   onClickRow: onClickRow_deviceCheck,
	   onClickCell:onClickCell_deviceCheck
	   ">

	<thead>
		<tr>

			<th data-options="field:'ck',checkbox:true"></th>

			<th
				data-options="field:'deviceCheckID',width:80,align:'center',sortable:true,
							type:'text'
			">������</th>

			<th
				data-options="field:'deviceID',width:80,align:'center',sortable:true,
							editor:{
								type:'textbox',
								options:{
									required:true									
								}
							}
			">�豸���</th>

			<th
				data-options="field:'deviceIDD',width:100,align:'center',sortable:true,
							formatter:function(value,row){
								return row.deviceName;
							},
							editor:{
								type:'combobox',
								options:{
									valueField:'deviceIDD',
									textField:'deviceName',
									method:'get',
									url:'json/deviceCheck_Name.json',
									panelHeight:'auto' 
								}
							}
			
			">�豸����</th>

			<th
				data-options="field:'deviceCheckEmp',width:120,align:'center', 
						editor:'text'
			">������</th>

			<th
				data-options="field:'deviceCheckDate',width:190,align:'center', sortable:true,
						editor:'datetimebox'
			">����ʱ��</th>

			<th
				data-options="field:'deviceCheckResult',width:120,align:'center', 
						editor:'text'
			">������</th>
			
			<th
				data-options="field:'deviceCheckFaultIDD',width:100,align:'center',sortable:true,
							formatter:function(value,row){
								return row.deviceCheckFaultID;
							},
							editor:{
								type:'combobox',
								options:{
									valueField:'deviceCheckFaultIDD',
									textField:'deviceCheckFaultID',
									method:'get',
									url:'json/deviceCheck_FaultID.json',
									panelHeight:'auto' 
								}
							}
			
			">�豸���ϱ��</th>
			
			
		</tr>
	</thead>
</table>

<div style="margin:8px 0;"></div>

<div id="tabs_deviceCheck" class="easyui-tabs"
	style="width:100%;height:331px">
	<!-- tabPosition="left" -->
	<div title="����" style="padding:10px">
		<p style="font-size:16px">��ѡ��������豸��Ϣ�������豸��������Ϣ���͡��豸������Ϣ������ѡ� --></p>
		<ul style="font-size:14px">
			<li>���ÿ�����ݵġ��豸��š��ֶλ������ˡ��ֶλ��豸���ϱ�š��ֶοɲ鿴���Ӧ����ϸ��Ϣ</li>
		</ul>
	</div>

	<!-- Device Info Tab
	closable:true -->

	<div id="tab_device_deviceCheck" title="�豸��Ϣ"
		data-options="iconCls:'icon-tip',closable:true " style="padding:10px">
		<form id="tab_device_form_deviceCheck" class="easyui-form" method="post">
			<table cellpadding="4">
				<tr>
					<td>�豸���� :</td>
					<td><input class="easyui-textbox" type="text"
						name="name_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>

					<td>�豸���� :</td>
					<td><input class="easyui-textbox" type="text"
						name="typeName_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�������� :</td>
					<td><input class="easyui-datetimebox" type="datetime"
						name="manufactureDate_form_deviceCheck" style="width:138px"
						data-options="editable:false" /></td>

					<td>ʹ������ :</td>
					<td><input class="easyui-textbox" type="text"
						name="serviceLife_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�������� :</td>
					<td><input class="easyui-datetimebox" type="datetime"
						name="purchaseDate_form_deviceCheck" style="width:138px"
						data-options="editable:false" /></td>

					<td>�豸״̬ :</td>
					<td><input class="easyui-textbox" type="text"
						name="status_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>������ :</td>
					<td><input class="easyui-textbox" type="text"
						name="keeper_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>��ע :</td>
					<td><input class="easyui-textbox" type="text"
						name="note_form_deviceCheck" style="width:99px;height:99px;"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>��ȫ....</td>
				</tr>
			</table>
		</form>
	</div>
 
	<!-- Device Emp Tab
	closable:true -->
	<div id="tab_deviceEmp_deviceCheck" title="�豸��������Ϣ"
		data-options="iconCls:'icon-tip',closable:true  " style="padding:10px">
		<form id="tab_deviceEmp_form_deviceCheck" class="easyui-form" method="post">
			<table cellpadding="4">
				<tr>
					<td>��� :</td>
					<td><input class="easyui-textbox" type="text"
						name="empID_form_deviceCheck" style="width:99px" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>���� :</td>
					<td><input class="easyui-textbox" type="text"
						name="empName_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>

					<td>�Ա� :</td>
					<td><input class="easyui-textbox" type="text"
						name="empSex_form_deviceCheck" style="width:99px" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�������� :</td>
					<td><input class="easyui-datebox" type="date"
						name="empBirthday_form_deviceCheck" style="width:147px"
						data-options="editable:false" /></td>

					<td>���֤�� :</td>
					<td><input class="easyui-numberbox" type="number"
						name="empPersonalIdentity_form_deviceCheck" style="width:156px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>��ְ���� :</td>
					<td><input class="easyui-datebox" type="date"
						name="empEntryDate_form_deviceCheck" style="width:147px"
						data-options="editable:false" /></td>

					<td>�������� :</td>
					<td><input class="easyui-textbox" type="text" name="empDept_form_deviceCheck"
						style="width:99px" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>Ա��״̬ :</td>
					<td><input class="easyui-textbox" type="text" name="empStatus_form_deviceCheck"
						style="width:99px" data-options="editable:false" /></td>
				</tr>

				<tr>
					<td>��ȫ....</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- Device Fault Tab
	closable:true -->
	<div id="tab_deviceFault_deviceCheck" title="�豸������Ϣ"
		data-options="iconCls:'icon-tip',closable:true  " style="padding:10px">
		<form id="tab_deviceFault_form_deviceCheck" class="easyui-form" method="post">
			<table cellpadding="4">
				<tr>
					<td>���ϱ�� :</td>
					<td><input class="easyui-textbox" type="text"
						name="faultID_form_deviceCheck" style="width:99px" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�豸��� :</td>
					<td><input class="easyui-textbox" type="text"
						name="deviceID_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>

					<td>�豸���� :</td>
					<td><input class="easyui-textbox" type="text"
						name="deviceName_form_deviceCheck" style="width:99px" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�������� :</td>
					<td><input class="easyui-datebox" type="date"
						name="faultDate_form_deviceCheck" style="width:147px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>����ԭ�� :</td>
					<td><input class="easyui-textbox" type="text"
						name="faultCause_form_deviceCheck" style="width:147px;height:147px;"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>ά�޷�ʽ :</td>
					<td><input class="easyui-textbox" type="text" name="maintenance_form_deviceCheck"
						style="width:147px" data-options="editable:false" /></td>
				</tr>

			</table>
		</form>
	</div>
</div>

 
<div id="toobar_deviceCheck" style="height:auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true" onclick="append_deviceCheck()">���</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true" onclick="remove_deviceCheck()">�Ƴ�</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true" onclick="reject_deviceCheck()">����</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true" onclick="accept_deviceCheck()">����</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true" onclick="getChanges_deviceCheck()">�鿴�ı�</a>
</div>

<div style="margin:18x 0;"></div>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>

<script type="text/javascript">
	var deviceCheckEditIndex = undefined;
	function endEditing_deviceCheck() {
		if (deviceCheckEditIndex == undefined) {
			return true
		}
		if ($('#deviceCheck').datagrid('validateRow', deviceCheckEditIndex)) {
			/* deviceName */
			var deviceNameED = $('#deviceCheck').datagrid('getEditor', {
				index : deviceCheckEditIndex,
				field : 'deviceIDD'
			});
			var deviceName = $(deviceNameED.target).combobox('getText');
			$('#deviceCheck').datagrid('getRows')[deviceCheckEditIndex]['deviceName'] = deviceName;
			
			/* deviceCheckFaultID */
			var deviceCheckFaultIDED = $('#deviceCheck').datagrid('getEditor', {
				index : deviceCheckEditIndex,
				field : 'deviceCheckFaultIDD'
			});
			var deviceCheckFaultID = $(deviceCheckFaultIDED.target).combobox('getText');
			$('#deviceCheck').datagrid('getRows')[deviceCheckEditIndex]['deviceCheckFaultID'] = deviceCheckFaultID;

			/* End Edit */
			$('#deviceCheck').datagrid('endEdit', deviceCheckEditIndex);
			deviceCheckEditIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	
	
	var onClickCellFieldValue_deviceCheck = "";
	function onClickCell_deviceCheck(index, field) {
		onClickCellFieldValue_deviceCheck = field;
	} 


	function onClickRow_deviceCheck(index, row) {
		if (deviceCheckEditIndex != index) {
			if (endEditing_deviceCheck()) {
				$('#deviceCheck').datagrid('selectRow', index).datagrid(
						'beginEdit', index);
				deviceCheckEditIndex = index;
			} else {
				$('#deviceCheck').datagrid('selectRow', deviceCheckEditIndex);
			}
			$('#deviceCheck').datagrid('clearSelections');
		}

		if (onClickCellFieldValue_deviceCheck === "deviceID") {
			var tabs_deviceCheck = $("#tabs_deviceCheck");
			var detailInfoTab = tabs_deviceCheck.tabs("getTab", "�豸��Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceCheck.tabs("select", "�豸��Ϣ");
loadData_name_form_deviceCheck(row.deviceID);		
		} else if (onClickCellFieldValue_deviceCheck === "deviceCheckEmp") {
			var tabs_deviceCheck = $("#tabs_deviceCheck");
			var detailInfoTab = tabs_deviceCheck.tabs("getTab", "�豸��������Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceCheck.tabs("select", "�豸��������Ϣ");
loadData_empName_form_deviceCheck(row.deviceCheckEmp);
		}else if (onClickCellFieldValue_deviceCheck === "deviceCheckFaultIDD") {
			var tabs_deviceCheck = $("#tabs_deviceCheck");
			var detailInfoTab = tabs_deviceCheck.tabs("getTab", "�豸������Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceCheck.tabs("select", "�豸������Ϣ");
loadData_faultID_form_deviceCheck(row.deviceCheckFaultIDD);
		}

	}
 
	function append_deviceCheck() {
		if (endEditing_deviceCheck()) {
			var newIDIndex = $('#deviceCheck').datagrid('getRows').length - 1;
			var newID_string = $('#deviceCheck').datagrid('getRows')[newIDIndex].deviceCheckID;
			var newID_int = parseInt(newID_string) + 1;
			if (newID_int < 10)
				newID_int = "00" + newID_int;
			else if (newID_int < 100)
				newID_int = "0" + newID_int;

			$('#deviceCheck').datagrid('appendRow', {
				deviceCheckID : newID_int
			});
			deviceCheckEditIndex = $('#deviceCheck').datagrid('getRows').length - 1;
			$('#deviceCheck').datagrid('selectRow', deviceCheckEditIndex).datagrid(
					'beginEdit', deviceCheckEditIndex);

			$('#deviceCheck').datagrid('clearSelections');
		}
	}

	function remove_deviceCheck() {
		var selections = $('#deviceCheck').datagrid('getSelections');

		for (var i = 0; i < selections.length; i++) {
			var selectionIndex = $('#deviceCheck').datagrid('getRowIndex',
					selections[i]);
			$('#deviceCheck').datagrid('deleteRow', selectionIndex);
		}
		deviceCheckEditIndex = undefined;
	}

	function accept_deviceCheck() {
		if (endEditing_deviceCheck()) {
			$('#deviceCheck').datagrid('acceptChanges');
		}
	}

	function reject_deviceCheck() {
		$('#deviceCheck').datagrid('rejectChanges');
		deviceCheckEditIndex = undefined;
	}

	function getChanges_deviceCheck() {
		var rows = $('#deviceCheck').datagrid('getChanges');
		alert(rows.length + ' rows are changed!');
	}
 
</script>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>


<%------------------------------------- �ﾳ�˵� ----------------------------------------------%>
  
<script type="text/javascript">
	$(function() {
		$('#deviceCheck').datagrid({
			fitColumns : true,
			onHeaderContextMenu : function(e, field) {
				e.preventDefault();
				if (!deviceCheckContextMenu) {
					createColumnMenu_deviceCheck();
				}
				deviceCheckContextMenu.menu('show', {
					left : e.pageX,
				});
			}
		});
	});
	var deviceCheckContextMenu;
	function createColumnMenu_deviceCheck() {
		deviceCheckContextMenu = $('<div/>').appendTo('body');
		deviceCheckContextMenu.menu({
			onClick : function(item) {
				if (item.iconCls == 'icon-ok') {
					$('#deviceCheck').datagrid('hideColumn', item.name);
					deviceCheckContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					$('#deviceCheck').datagrid('showColumn', item.name);
					deviceCheckContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
		var fields = $('#deviceCheck').datagrid('getColumnFields');
		for (var i = 1; i < fields.length; i++) {
			var field = fields[i];
			var col = $('#deviceCheck').datagrid('getColumnOption', field);
			deviceCheckContextMenu.menu('appendItem', {
				text : col.title,
				name : field,
				iconCls : 'icon-ok'
			});
		}
	}
</script>
 
<%------------------------------------- �ﾳ�˵� ----------------------------------------------%>

<%------------------------------------- JQuery Easy UI Filter -------------------------------------%>

<style>
.icon-filter {
	background: url('image/filter.png') no-repeat center center;
}
</style>

<script>
	$(function() {
	
		var deviceCheckForFilter = $('#deviceCheck').datagrid({
			filterBtnIconCls : 'icon-filter'
		});

		deviceCheckForFilter.datagrid('enableFilter', [ {
			field : 'deviceCheckID',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceID',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceCheckDate',
			type : 'datetimebox',
			options:{
				editable : false
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceCheckFaultIDD',
			type : 'text',
			options : {
				precision : -1
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}]);
	});

</script>

<%------------------------------------- JQuery Easy UI Filter -------------------------------------%>

<%------------------------------------- Tabs Mouseenter Event -------------------------------------%>
 
<script type="text/javascript">
	function mouseEnterEvent_deviceCheck() {
		var deviceCheckTabs = $('#tabs_deviceCheck').tabs().tabs('tabs');
		for (var i = 0; i < deviceCheckTabs.length; i++) {
			deviceCheckTabs[i].panel('options').tab.unbind().bind('mouseenter', {
				index : i
			}, function(e) {
				$('#tabs_deviceCheck').tabs('select', e.data.index);
			});
		}
	};
</script>

<%------------------------------------- Tabs Mouseenter Event -------------------------------------%>

<%-------------------------------------  Tabs  -------------------------------------%>
 
<script type="text/javascript">
	
	/* ��̬�������ݣ���Ϊ���ԣ����ٶ�̬�����ݿ����� */
	function loadData_name_form_deviceCheck(deviceName) {
		$('#tab_device_form_deviceCheck').form('load', {
			name_form_deviceCheck : deviceName

		});
	}
	/* ��̬�������ݣ���Ϊ���� �����ٶ�̬�����ݿ�����*/
	function loadData_empName_form_deviceCheck(deviceEmpName) {
		$('#tab_deviceEmp_form_deviceCheck').form('load', {
			empName_form_deviceCheck : deviceEmpName

		});
	}
	/* ��̬�������ݣ���Ϊ���� �����ٶ�̬�����ݿ�����*/
	function loadData_faultID_form_deviceCheck(deviceCheckFaultIDD) {
		$('#tab_deviceFault_form_deviceCheck').form('load', {
			faultID_form_deviceCheck : deviceCheckFaultIDD

		});
	}
</script> 

<%------------------------------------- Add or Remove Tabs  -------------------------------------%>

<%--------------------------------------------------------------------------%>

<script>
	$(function() {
		mouseEnterEvent_deviceCheck();

		 var deviceCheck_Tab_DeviceInfo = $('#tabs_deviceCheck').tabs('getTab', "�豸��Ϣ").panel(
				'options').tab;
		deviceCheck_Tab_DeviceInfo.hide(); 
		
		var deviceCheck_Tab_Emp = $('#tabs_deviceCheck').tabs('getTab', "�豸��������Ϣ").panel(
				'options').tab;
		deviceCheck_Tab_Emp.hide();
		
		var deviceCheck_Tab_Fault = $('#tabs_deviceCheck').tabs('getTab', "�豸������Ϣ").panel(
				'options').tab;
		deviceCheck_Tab_Fault.hide();
	});
	$('#tabs_deviceCheck').tabs(
			{
				onBeforeClose : function(title, index) {
					if (title === "�豸��Ϣ") {
						var deviceCheck_Tab_DeviceInfo = $('#tabs_deviceCheck').tabs('getTab',
								"�豸��Ϣ").panel('options').tab;
						deviceCheck_Tab_DeviceInfo.hide();
					} else if (title === "�豸��������Ϣ") {
						var deviceCheck_Tab_Emp = $('#tabs_deviceCheck').tabs('getTab',
								"�豸��������Ϣ").panel('options').tab;
						deviceCheck_Tab_Emp.hide();
					} else if (title === "�豸������Ϣ") {
						var deviceCheck_Tab_Fault = $('#tabs_deviceCheck').tabs('getTab',
								"�豸������Ϣ").panel('options').tab;
						deviceCheck_Tab_Fault.hide();
					}
					/* �ֶ�ѡ����ѡ����������ص�ѡ��������޷����� */
					$("#tabs_deviceCheck").tabs("select", 0);

					return false; // ��ֹ�ر�
				}
			});
</script>

<%--------------------------------------------------------------------------%>