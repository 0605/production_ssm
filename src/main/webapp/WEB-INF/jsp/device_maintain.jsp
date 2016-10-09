<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>

<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<!-- singleSelect:true, -->
<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<table id="deviceMaintain" title="�豸ά��" style="height:389px"
	data-options="
	   rownumbers:true,
	   toolbar:'#toobar_deviceMaintain',
	   url:'json/deviceMaintain_All.json',
	   method:'get',
	   pagination:true,
	   pageSize:10,
	   pageList:[10, 20, 30], 
	   remoteSort:false,
	   multiSort:true,
	   onClickRow: onClickRow_deviceMaintain,
	   onClickCell:onClickCell_deviceMaintain
	   ">

	<thead>
		<tr>

			<th data-options="field:'ck',checkbox:true"></th>

			<th
				data-options="field:'deviceMaintainID',width:80,align:'center',sortable:true,
							type:'text'
			">ά�ޱ��</th>

			<th
				data-options="field:'deviceFaultID',width:80,align:'center',sortable:true,
							editor:{
								type:'textbox',
								options:{
									required:true									
								}
							}
			">���ϱ��</th>

			<th
				data-options="field:'deviceMaintainEmp',width:100,align:'center',sortable:true,
							editor:'text'
			">ά����</th>

			<th
				data-options="field:'deviceMaintainDate',width:120,align:'center', 
						editor:'datetimebox'
			">ά������</th>

			<th
				data-options="field:'deviceMaintainDetail',width:138,align:'center', 
						editor:'text'
			">ά�޽��</th>

			<th
				data-options="field:'deviceMaintainCost',width:190,align:'center', sortable:true,
						editor:{
							type:'numberbox',
							options:{
								min:0,
								max:99999,
								precision:2
							}
						}
			">ά�޷���</th>

			<th
				data-options="field:'note',width:200,align:'center', 
						editor:'text'
			">��ע</th>

		</tr>
	</thead>
</table>

<div style="margin:8px 0;"></div>

<div id="tabs_deviceMaintain" class="easyui-tabs"
	style="width:100%;height:331px">
	<!-- tabPosition="left" -->
	<div title="����" style="padding:10px">
		<p style="font-size:16px">��ѡ��������豸������Ϣ��һ��ѡ� --></p>
		<ul style="font-size:14px">
			<li>���ÿ�����ݵġ����ϱ�š��ֶοɲ鿴���Ӧ����ϸ��Ϣ</li>
		</ul>
	</div>

	<!-- Device Fault Tab
	closable:true -->
	<div id="tab_deviceFault_deviceMaintain" title="�豸������Ϣ"
		data-options="iconCls:'icon-tip',closable:true  " style="padding:10px">
		<form id="tab_deviceFault_form_deviceMaintain" class="easyui-form"
			method="post">
			<table cellpadding="4">
				<tr>
					<td>���ϱ�� :</td>
					<td><input class="easyui-textbox" type="text"
						name="faultID_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>�豸��� :</td>
					<td><input class="easyui-textbox" type="text"
						name="deviceID_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>

					<td>�豸���� :</td>
					<td><input class="easyui-textbox" type="text"
						name="deviceName_form_deviceCheck" style="width:99px"
						data-options="editable:false" /></td>
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
						name="faultCause_form_deviceCheck"
						style="width:147px;height:147px;" data-options="editable:false" /></td>
				</tr>
				<tr>
					<td>ά�޷�ʽ :</td>
					<td><input class="easyui-textbox" type="text"
						name="maintenance_form_deviceCheck" style="width:147px"
						data-options="editable:false" /></td>
				</tr>

			</table>
		</form>
	</div>

</div>

<div id="toobar_deviceMaintain" style="height:auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-add',plain:true"
		onclick="append_deviceMaintain()">���</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true"
		onclick="remove_deviceMaintain()">�Ƴ�</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true"
		onclick="reject_deviceMaintain()">����</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true"
		onclick="accept_deviceMaintain()">����</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true"
		onclick="getChanges_deviceMaintain()">�鿴�ı�</a>
</div>

<div style="margin:18x 0;"></div>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>

<script type="text/javascript">
	var deviceMaintainEditIndex = undefined;
	function endEditing_deviceMaintain() {
		if (deviceMaintainEditIndex == undefined) {
			return true
		}
		if ($('#deviceMaintain').datagrid('validateRow',
				deviceMaintainEditIndex)) {

			/* End Edit */
			$('#deviceMaintain').datagrid('endEdit', deviceMaintainEditIndex);
			deviceMaintainEditIndex = undefined;
			return true;
		} else {
			return false;
		}
	}

	var onClickCellFieldValue_deviceMaintain = "";
	function onClickCell_deviceMaintain(index, field) {
		onClickCellFieldValue_deviceMaintain = field;
	}

	function onClickRow_deviceMaintain(index, row) {
		if (deviceMaintainEditIndex != index) {
			if (endEditing_deviceMaintain()) {
				$('#deviceMaintain').datagrid('selectRow', index).datagrid(
						'beginEdit', index);
				deviceMaintainEditIndex = index;
			} else {
				$('#deviceMaintain').datagrid('selectRow',
						deviceMaintainEditIndex);
			}
			/* ������bug����������У�Ȼ�����Ƴ����ٵ��������ʱ���༭״̬���ִ��󣬻���˼·���һ�¡� */
			$('#deviceMaintain').datagrid('clearSelections');
		}

		 if (onClickCellFieldValue_deviceMaintain === "deviceFaultID") {
			var tabs_deviceMaintain = $("#tabs_deviceMaintain");
			var detailInfoTab = tabs_deviceMaintain.tabs("getTab", "�豸������Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceMaintain.tabs("select", "�豸������Ϣ");
loadData_faultID_form_deviceMaintain(row.deviceFaultID); 	 	
		} 

	}

	function append_deviceMaintain() {
		if (endEditing_deviceMaintain()) {
			var newIDIndex = $('#deviceMaintain').datagrid('getRows').length - 1;
			var newID_string = $('#deviceMaintain').datagrid('getRows')[newIDIndex].deviceMaintainID;
			var newID_int = parseInt(newID_string) + 1;
			if (newID_int < 10)
				newID_int = "00" + newID_int;
			else if (newID_int < 100)
				newID_int = "0" + newID_int;

			$('#deviceMaintain').datagrid('appendRow', {
				deviceMaintainID : newID_int
			});
			deviceMaintainEditIndex = $('#deviceMaintain').datagrid('getRows').length - 1;
			$('#deviceMaintain').datagrid('selectRow', deviceMaintainEditIndex)
					.datagrid('beginEdit', deviceMaintainEditIndex);

			$('#deviceMaintain').datagrid('clearSelections');
		}
	}

	function remove_deviceMaintain() {
		var selections = $('#deviceMaintain').datagrid('getSelections');

		for (var i = 0; i < selections.length; i++) {
			var selectionIndex = $('#deviceMaintain').datagrid('getRowIndex',
					selections[i]);
			$('#deviceMaintain').datagrid('deleteRow', selectionIndex);
		}
		deviceMaintainEditIndex = undefined;
	}

	function accept_deviceMaintain() {
		if (endEditing_deviceMaintain()) {
			$('#deviceMaintain').datagrid('acceptChanges');
		}
	}

	function reject_deviceMaintain() {
		$('#deviceMaintain').datagrid('rejectChanges');
		deviceMaintainEditIndex = undefined;
	}

	function getChanges_deviceMaintain() {
		var rows = $('#deviceMaintain').datagrid('getChanges');
		alert(rows.length + ' rows are changed!');
	}
</script>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>


<%------------------------------------- �ﾳ�˵� ----------------------------------------------%>

<script type="text/javascript">
	$(function() {
		$('#deviceMaintain').datagrid({
			fitColumns : true,
			onHeaderContextMenu : function(e, field) {
				e.preventDefault();
				if (!deviceMaintainContextMenu) {
					createColumnMenu_deviceMaintain();
				}
				deviceMaintainContextMenu.menu('show', {
					left : e.pageX,
				});
			}
		});
	});
	var deviceMaintainContextMenu;
	function createColumnMenu_deviceMaintain() {
		deviceMaintainContextMenu = $('<div/>').appendTo('body');
		deviceMaintainContextMenu.menu({
			onClick : function(item) {
				if (item.iconCls == 'icon-ok') {
					$('#deviceMaintain').datagrid('hideColumn', item.name);
					deviceMaintainContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					$('#deviceMaintain').datagrid('showColumn', item.name);
					deviceMaintainContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
		var fields = $('#deviceMaintain').datagrid('getColumnFields');
		for (var i = 1; i < fields.length; i++) {
			var field = fields[i];
			var col = $('#deviceMaintain').datagrid('getColumnOption', field);
			deviceMaintainContextMenu.menu('appendItem', {
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

		var deviceMaintainForFilter = $('#deviceMaintain').datagrid({
			filterBtnIconCls : 'icon-filter'
		});

		deviceMaintainForFilter.datagrid('enableFilter', [ {
			field : 'deviceMaintainID',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceFaultID',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceMaintainDate',
			type : 'datetimebox',
			options : {
				editable : false
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		} ]);
	});
</script>

<%------------------------------------- JQuery Easy UI Filter -------------------------------------%>

<%------------------------------------- Tabs Mouseenter Event -------------------------------------%>

<script type="text/javascript">
	function mouseEnterEvent_deviceMaintain() {
		var deviceMaintainTabs = $('#tabs_deviceMaintain').tabs().tabs('tabs');
		for (var i = 0; i < deviceMaintainTabs.length; i++) {
			deviceMaintainTabs[i].panel('options').tab.unbind().bind('mouseenter', {
				index : i
			}, function(e) {
				$('#tabs_deviceMaintain').tabs('select', e.data.index);
			});
		}
	};
</script>

<%------------------------------------- Tabs Mouseenter Event -------------------------------------%>

<%-------------------------------------  Tabs  -------------------------------------%>
 
<script type="text/javascript">
	
	/* ��̬�������ݣ���Ϊ���ԣ����ٶ�̬�����ݿ����� */
	function loadData_faultID_form_deviceMaintain(deviceFaultID) {
		$('#tab_deviceFault_form_deviceMaintain').form('load', {
			faultID_form_deviceCheck : deviceFaultID

		});
	}
</script> 

<%------------------------------------- Add or Remove Tabs  -------------------------------------%>

<%--------------------------------------------------------------------------%>
 
<script>
	$(function() {

		mouseEnterEvent_deviceMaintain();

		 var tab_deviceFault_deviceMaintain = $('#tabs_deviceMaintain').tabs('getTab', "�豸������Ϣ").panel(
				'options').tab;
		tab_deviceFault_deviceMaintain.hide(); 
		
	});
	$('#tabs_deviceMaintain').tabs(
			{
				onBeforeClose : function(title, index) {
					if (title === "�豸������Ϣ") {
						var tab_deviceFault_deviceMaintain = $('#tabs_deviceMaintain').tabs('getTab',
								"�豸������Ϣ").panel('options').tab;
						tab_deviceFault_deviceMaintain.hide();
					} 
					/* �ֶ�ѡ����ѡ����������ص�ѡ��������޷����� */
					$("#tabs_deviceMaintain").tabs("select", 0);

					return false; // ��ֹ�ر�
				}
			});
</script>

<%--------------------------------------------------------------------------%>