<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>

<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<!-- singleSelect:true, -->
<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->


<!-- =��=   �����˹�������Ϳ����Զ���ҳ�� -->

<table id="deviceList" title="�豸̨��" style="height:389px"
	data-options="
	   rownumbers:true,
	   toolbar:'#toobar_deviceList',
	   url:'json/deviceList_All.json',
	   method:'get',
	   pagination:true,
	   pageSize:10,
	   pageList:[10, 20, 30], 
	   remoteSort:false,
	   multiSort:true,
	   onClickRow: onClickRow_deviceList,
	   onClickCell: onClickCell_deviceList">

	<thead>
		<tr>

			<th data-options="field:'ck',checkbox:true"></th>

			<th
				data-options="field:'deviceId',width:80,align:'center',sortable:true,
							type:'text'
			">Id</th>

			<th
				data-options="field:'deviceIdd',width:100,align:'center',sortable:true,
							formatter:function(value,row){
								return row.deviceName;
							},
							editor:{
								type:'combobox',
								options:{
									valueField:'deviceIdd',
									textField:'deviceName',
									method:'get',
									url:'json/deviceList_Name.json',
									panelHeight:'auto',
									required:true
								}
							}
			
			">����</th>

			<th
				data-options="field:'deviceTypeId',width:100,align:'center' ,sortable:true,
							formatter:function(value,row){
								return row.deviceTypeName;
							},
							editor:{
								type:'combobox',
								options:{
									valueField:'deviceTypeId',
									textField:'deviceTypeName',
									method:'get',
									url:'json/deviceList_Type.json',
									editable:false,
									panelHeight:'auto' 
								}
							}
				
			
			">����</th>

			<th
				data-options="field:'deviceStatusId',width:100,align:'center',sortable:true,
						formatter:function(value,row){
							return row.deviceStatus;
						},
						editor:{
							type:'combobox',
							options:{
								valueField:'deviceStatusId',
								textField:'deviceStatus',
								url:'json/deviceList_Status.json',
								method:'get',
								editable:false,
								panelHeight:'auto'
							}
						}
				
			">״̬</th>

			<th
				data-options="field:'devicePurchaseDate',width:190,align:'center', sortable:true,
						editor:'datetimebox'
			">��������</th>

			<th
				data-options="field:'devicePurchasePrice',width:100,align:'center',
						editor:{
							type:'numberbox',
							options:{
								min:0,
								max:999999,
								precision:2
							}
						}
					
			">����۸�</th>

			<th
				data-options="field:'deviceManufactureDate',width:190,align:'center',sortable:true, 
							editor:'datetimebox'
			">��������</th>

			<th
				data-options="field:'deviceServiceLife',width:100,align:'center',sortable:true,
						editor:{ 
							type:'numberbox',
							options:{
								min:0,
								max:12
							}
						}
				">ʹ������</th>

			<th
				data-options="field:'deviceKeeper',width:120,align:'center', 
						editor:'text'
			">������</th>

			<th
				data-options="field:'note',width:270,align:'center',
						editor:'text'
			">��ע</th>

		</tr>
	</thead>
</table>

<div style="margin:8px 0;"></div>

<div id="toobar_deviceList" style="height:auto">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		data-options="iconCls:'icon-edit',plain:true"
		onclick="edit_deviceList()">�༭</a> <a href="javascript:void(0)"
		class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
		onclick="append_deviceList()">���</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-remove',plain:true"
		onclick="remove_deviceList()">�Ƴ�</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-undo',plain:true"
		onclick="reject_deviceList()">����</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-save',plain:true"
		onclick="accept_deviceList()">����</a> <a href="javascript:void(0)"
		class="easyui-linkbutton"
		data-options="iconCls:'icon-search',plain:true,disable:true"
		onclick="getChanges_deviceList()">�鿴�ı�</a>
</div>

<div style="margin:18x 0;"></div>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>

<script type="text/javascript">
	var deviceListEditIndex = undefined;
	function endEditing_deviceList() {
		if (deviceListEditIndex == undefined) {
			return true
		}
		if ($('#deviceList').datagrid('validateRow', deviceListEditIndex)) {

			/* deviceName */
			var deviceNameED_List = $('#deviceList').datagrid('getEditor', {
				index : deviceListEditIndex,
				field : 'deviceIdd'
			});
			var deviceName = $(deviceNameED_List.target).combobox('getText');
			$('#deviceList').datagrid('getRows')[deviceListEditIndex]['deviceName'] = deviceName;
			/* deviceTypeName */
			var deviceTypeNameED_List = $('#deviceList').datagrid('getEditor',
					{
						index : deviceListEditIndex,
						field : 'deviceTypeId'
					});
			var deviceTypeName = $(deviceTypeNameED_List.target).combobox(
					'getText');
			$('#deviceList').datagrid('getRows')[deviceListEditIndex]['deviceTypeName'] = deviceTypeName;
			/* deviceStatus */
			var deviceStatusED_List = $('#deviceList').datagrid('getEditor', {
				index : deviceListEditIndex,
				field : 'deviceStatusId'
			});
			var deviceStatus = $(deviceStatusED_List.target)
					.combobox('getText');
			$('#deviceList').datagrid('getRows')[deviceListEditIndex]['deviceStatus'] = deviceStatus;

			/* End Edit */
			$('#deviceList').datagrid('endEdit', deviceListEditIndex);
			deviceListEditIndex = undefined;
			return true;
		} else {
			return false;
		}
	}

	var onClickCellFieldValue_deviceList = "";

	function onClickCell_deviceList(index, field) {
		onClickCellFieldValue_deviceList = field;
	}

	function onClickRow_deviceList(index, row) {

		if (onClickCellFieldValue_deviceList === "deviceTypeName") {
			var tabs_deviceList = $("#tabs_deviceList");
			var detailInfoTab = tabs_deviceList.tabs("getTab", "�豸������Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceList.tabs("select", "�豸������Ϣ");
			loadDataToDeviceTypeNameInfoForm(row.deviceTypeName);
		} else if (onClickCellFieldValue_deviceList === "deviceKeeper") {
			var tabs_deviceList = $("#tabs_deviceList");
			var detailInfoTab = tabs_deviceList.tabs("getTab", "�豸��������Ϣ");
			detailInfoTab.panel('options').tab.show();
			tabs_deviceList.tabs("select", "�豸��������Ϣ");
			loadDataToDeviceKeeperNameInfoForm(row.deviceKeeper);
		}

		/* var rows = $('#deviceList').datagrid('getChanges');
		console.log(rows.length + ' rows are changed!'); */

	}

	function edit_deviceList() {
		
		/* �õ�����ѡ���е����� */
		var rowSelections = $('#deviceList').datagrid('getSelections');
		if(rowSelections.length==0){
			return;		
		}
		if(rowSelections.length>=2){
			$.messager.alert('��ʾ','��ѡ��һ����¼����༭��','warning');
        	return ;
		}
		/* �õ�ѡ���е����� */
		var rowSelection = rowSelections[0];
		var rowSelectionIndex = $('#deviceList').datagrid('getRowIndex',rowSelection);

		/* ����༭״̬ */
		if (deviceListEditIndex != rowSelectionIndex) {
			if (endEditing_deviceList()) {
				$('#deviceList').datagrid('selectRow', rowSelectionIndex).datagrid(
						'beginEdit', rowSelectionIndex);
				deviceListEditIndex = rowSelectionIndex;
			} else {
				$('#deviceList').datagrid('selectRow', deviceListEditIndex);
			}
		}
		
		$('#deviceList').datagrid('clearSelections');
	}

	function append_deviceList() {

		if (endEditing_deviceList()) {
<%--  	
			var options = $('#deviceList').datagrid('getPager').data('pagination').options;
			//��ǰҳ��
			var currentPage = options.pageNumber;
			//����Ŀ��
			var totalRows = options.total;
			//��ҳ��
			var totalPages = Math.ceil(totalRows/options.pageSize);
			$('#deviceList').datagrid({pageNumber: totalPages});
			/* append_deviceList_assist(); */
--%>
	var newIdIndex = $('#deviceList').datagrid('getRows').length - 1;
			console.log("newIdIndex : " + newIdIndex);
			var newId_string = $('#deviceList').datagrid('getRows')[newIdIndex].deviceId;
			var newId_int = parseInt(newId_string) + 1;
			if (newId_int < 10)
				newId_int = "00" + newId_int;
			else if (newId_int < 100)
				newId_int = "0" + newId_int;

			$('#deviceList').datagrid('appendRow', {
				deviceId : newId_int
			});

			deviceListEditIndex = $('#deviceList').datagrid('getRows').length - 1;
			$('#deviceList').datagrid('selectRow', deviceListEditIndex)
					.datagrid('beginEdit', deviceListEditIndex);

			$('#deviceList').datagrid('clearSelections');
		}
	}

	function remove_deviceList() {

		var selections = $('#deviceList').datagrid('getSelections');
		if(selections.length==0){
			$.messager.alert('��ʾ','������ѡ��һ���豸��Ϣ�����Ƴ���','warning');
        	return ;
		}
		
		for (var i = 0; i < selections.length; i++) {
			var selectionIndex = $('#deviceList').datagrid('getRowIndex',
					selections[i]);
			$('#deviceList').datagrid('deleteRow', selectionIndex);
		}
		if (selections.length > 0) {
			deviceListEditIndex = undefined;
		}
	}

	function accept_deviceList() {
		if (endEditing_deviceList()) {
			$('#deviceList').datagrid('acceptChanges');
		}
	}

	function reject_deviceList() {

		$('#deviceList').datagrid('rejectChanges');
		deviceListEditIndex = undefined;
	}

	function getChanges_deviceList() {

		var rows = $('#deviceList').datagrid('getChanges', 'updated');
		alert(rows.length + ' rows are changed!');
	}
</script>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>


<%------------------------------------- �ﾳ�˵� ----------------------------------------------%>

<script type="text/javascript">
	$(function() {
		$('#deviceList').datagrid({
			fitColumns : true,
			onHeaderContextMenu : function(e, field) {
				e.preventDefault();
				if (!deviceListContextMenu) {
					createColumnMenu_deviceList();
				}
				deviceListContextMenu.menu('show', {
					left : e.pageX,
				});
			}
		});
	});
	var deviceListContextMenu;
	function createColumnMenu_deviceList() {
		deviceListContextMenu = $('<div/>').appendTo('body');
		deviceListContextMenu.menu({
			onClick : function(item) {
				if (item.iconCls == 'icon-ok') {
					$('#deviceList').datagrid('hideColumn', item.name);
					deviceListContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					$('#deviceList').datagrid('showColumn', item.name);
					deviceListContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
		var fields = $('#deviceList').datagrid('getColumnFields');
		for (var i = 1; i < fields.length; i++) {
			var field = fields[i];
			var col = $('#deviceList').datagrid('getColumnOption', field);
			deviceListContextMenu.menu('appendItem', {
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
		var dg = $('#deviceList').datagrid({
			filterBtnIconCls : 'icon-filter'
		});

		dg.datagrid('enableFilter', [ {
			field : 'deviceId',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceTypeId',
			type : 'combobox',
			options : {
				valueField : 'deviceTypeId',
				textField : 'deviceTypeName',
				method : 'get',
				url : 'json/deviceList_Type_Filter.json',
				panelHeight : 'auto',
				editable : false,
				onChange : function(value) {
					if (value != "ALL") {
						dg.datagrid('addFilterRule', {
							field : 'deviceTypeName',
							op : 'equal',
							value : value
						});
					}
					if (value == "ALL" || value == '') {
						dg.datagrid('removeFilterRule', 'deviceTypeName');
					}
					dg.datagrid('doFilter');
				}
			}
		}, {
			field : 'deviceStatusId',
			type : 'combobox',
			options : {
				valueField : 'deviceStatusId',
				textField : 'deviceStatus',
				method : 'get',
				url : 'json/deviceList_Status_Filter.json',
				panelHeight : 'auto',
				editable : false,
				onChange : function(value) {
					if (value != "ALL") {
						dg.datagrid('addFilterRule', {
							field : 'deviceStatus',
							op : 'equal',
							value : value
						});
					}
					if (value == "ALL" || value == '') {
						dg.datagrid('removeFilterRule', 'deviceStatus');
					}
					dg.datagrid('doFilter');
				}
			}
		}, {
			field : 'devicePurchaseDate',
			type : 'datetimebox',
			options : {
				editable : false
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'devicePurchasePrice',
			type : 'numberbox',
			options : {
				precision : 2
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceManufactureDate',
			type : 'datetimebox',
			options : {
				editable : false
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceServiceLife',
			type : 'numberbox',
			options : {
				precision : 0
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		} ]);

	});
</script>

<%------------------------------------- JQuery Easy UI Filter -------------------------------------%>
