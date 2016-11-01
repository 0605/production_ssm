<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="GBK"%>

<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<!-- singleSelect:true, -->
<!-- ��ע���table_data-options��ᵼ����IE����ʾ������  -- "IE����Ǻ��ϣ�ruo����zhi����" -->
<table id="deviceFault" title="�豸����" style="height:389px"></table>

<div style="margin:18x 0;"></div>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>

<script type="text/javascript">
	var deviceFaultEditIndex = undefined;
	function endEditing_deviceFault() {
		if (deviceFaultEditIndex == undefined) {
			return true
		}
		if ($('#deviceFault').datagrid('validateRow', deviceFaultEditIndex)) {
			/* deviceName */
			var deviceNameED = $('#deviceFault').datagrid('getEditor', {
				index : deviceFaultEditIndex,
				field : 'deviceIdd'
			});
			var deviceName = $(deviceNameED.target).combobox('getText');
			$('#deviceFault').datagrid('getRows')[deviceFaultEditIndex]['deviceName'] = deviceName;

			/* End Edit */
			$('#deviceFault').datagrid('endEdit', deviceFaultEditIndex);
			deviceFaultEditIndex = undefined;
			return true;
		} else {
			return false;
		}
	}


	function onClickRow_deviceFault(index, row) {

		var selections = $('#deviceFault').datagrid('getSelections');
		if(selections.length >=2){
			$('#deviceFault').datagrid('unselectAll');
			$('#deviceFault').datagrid('selectRow',index);
		}
		
		if(index != deviceFaultEditIndex && deviceFaultEditIndex != undefined){
			/* deviceName */
			var deviceNameED_List = $('#deviceFault').datagrid('getEditor',{
				index : deviceFaultEditIndex,
				field : 'deviceIdd'
			});
			var deviceName = $(deviceNameED_List.target).combobox(
					'getText');
			$('#deviceFault').datagrid('getRows')[deviceFaultEditIndex]['deviceName'] = deviceName;
			
			$('#deviceFault').datagrid('endEdit', deviceFaultEditIndex);
			deviceFaultEditIndex = undefined;
		}

	}

	function edit_deviceFault() {

		/* �õ�����ѡ���е����� */
		var rowSelections = $('#deviceFault').datagrid('getSelections');
		if (rowSelections.length == 0) {
			return;
		}
		if (rowSelections.length >= 2) {
			$.messager.alert('��ʾ', '��ѡ��һ����¼����༭��', 'warning');
			return;
		}
		/* �õ�ѡ���е����� */
		var rowSelection = rowSelections[0];
		var rowSelectionIndex = $('#deviceFault').datagrid('getRowIndex',
				rowSelection);

		/* ����༭״̬ */
		if (deviceFaultEditIndex != rowSelectionIndex) {
			if (endEditing_deviceFault()) {
				$('#deviceFault').datagrid('selectRow', rowSelectionIndex)
						.datagrid('beginEdit', rowSelectionIndex);
				deviceFaultEditIndex = rowSelectionIndex;
			} else {
				$('#deviceFault').datagrid('selectRow', deviceFaultEditIndex);
			}
		}

		$('#deviceFault').datagrid('clearSelections');
	}

	function append_deviceFault() {
		if (endEditing_deviceFault()) {
			var newIdIndex = $('#deviceFault').datagrid('getRows').length - 1;
			var newId_string = $('#deviceFault').datagrid('getRows')[newIdIndex].deviceFaultId;
			var newId_int = parseInt(newId_string) + 1;
			if (newId_int < 10)
				newId_int = "00" + newId_int;
			else if (newId_int < 100)
				newId_int = "0" + newId_int;

			$('#deviceFault').datagrid('appendRow', {
				deviceFaultId : newId_int
			});
			deviceFaultEditIndex = $('#deviceFault').datagrid('getRows').length - 1;
			$('#deviceFault').datagrid('selectRow', deviceFaultEditIndex)
					.datagrid('beginEdit', deviceFaultEditIndex);

			$('#deviceFault').datagrid('clearSelections');
		}
	}

	function remove_deviceFault() {
		var selections = $('#deviceFault').datagrid('getSelections');
		if(selections.length==0){
			$.messager.alert('��ʾ','������ѡ��һ���豸������Ϣ�����Ƴ���','warning');
        	return ;
		}
		
		for (var i = 0; i < selections.length; i++) {
			var selectionIndex = $('#deviceFault').datagrid('getRowIndex',
					selections[i]);
			$('#deviceFault').datagrid('deleteRow', selectionIndex);
		}
		if (selections.length > 0) {
			deviceFaultEditIndex = undefined;
		}
	}

	function accept_deviceFault() {
	
		if(deviceFaultEditIndex != undefined){
			/* deviceName */
			var deviceNameED_List = $('#deviceFault').datagrid('getEditor',{
				index : deviceFaultEditIndex,
				field : 'deviceIdd'
			});
			var deviceName = $(deviceNameED_List.target).combobox(
					'getText');
			$('#deviceFault').datagrid('getRows')[deviceFaultEditIndex]['deviceName'] = deviceName;
			
			$('#deviceFault').datagrid('endEdit', deviceFaultEditIndex);
			deviceFaultEditIndex = undefined;
		}
	
		//sync with database before accept
		var rowsInserted = $('#deviceFault').datagrid('getChanges', 'inserted');
		var rowsDeleted = $('#deviceFault').datagrid('getChanges', 'deleted');
		var rowsUpdated = $('#deviceFault').datagrid('getChanges', 'updated');

		//sync
		//Inserted
		for (var i = 0; i < rowsInserted.length; i++) {
			$.post("deviceFault/insert",rowsInserted[i], function(data){
			console.log(data.status);
				if(data.status == 200){
					console.log('��ӳɹ�!');
				}
			});
		}
		
		//Deleted
		for (var i = 0; i < rowsDeleted.length; i++) {
			$.post("deviceFault/delete",{"deviceFaultId":rowsDeleted[i].deviceFaultId}, function(data){
			console.log(data.status);
				if(data.status == 200){
					console.log('ɾ���ɹ�!');
				}
			});
		}
		 
		//Updated
		for (var i = 0; i < rowsUpdated.length; i++) {
			$.post("deviceFault/update",rowsUpdated[i], function(data){
			console.log(data.status);
				if(data.status == 200){
					console.log('���³ɹ�!');
				}
			});
		}
	 	
		
		if (endEditing_deviceFault()) {
			$('#deviceFault').datagrid('acceptChanges');
		}
	}

	function reject_deviceFault() {
		$('#deviceFault').datagrid('rejectChanges');
		deviceFaultEditIndex = undefined;
	}

	function getChanges_deviceFault() {
		var rows = $('#deviceFault').datagrid('getChanges');
		alert(rows.length + ' rows are changed!');
	}
</script>

<%------------------------------------- ADD DELETE UPDATE SEARCH -------------------------------------%>


<%------------------------------------- $.datagrid----------------------------------------------%>

<script type="text/javascript">
	$(function() {
		  	var list_name;
			$.ajax({    
			      url:'deviceList/list_name',    
			      dataType : 'json',    
			      type : 'GET',    
			      async:false,  
			      success: function (data){    
			      	list_name = data; 
			      }    
			});
			/* debugger;  */  
			$('#deviceFault').datagrid(  
                    {  
					   toolbar:'##toobar_deviceFault',
					   url:'deviceFault/list',
					   method:'get',
					   pagination:true,
					   pageSize:10,
					   pageList:[10, 20, 30], 
					   remoteSort:false,
					   multiSort:true,
					   onClickRow: onClickRow_deviceFault,
                       columns : [ [  
                                {  
                                    field : 'ck',  
                                    checkbox : true  
                                },  
                                {  
                                    field : 'deviceFaultId',  
                                    title : '���ϱ��',  
                                    width : 80,  
                                    align : 'center',
                                    sortable:true,  
                                    type:'text'
                                },  
                                {  
                                    field : 'deviceId',  
                                    title : '�豸���',  
                                    width : 80,  
                                    align : 'center',
                                    sortable:true, 
                                    editor:{
										 type:'textbox',
										 options:{
										 	 required:true									
										 }
									}
                                },  
                                {  
                                    field : 'deviceIdd',  
                                    title : '�豸����',  
                                    width : 100,  
                                    align : 'center',
                                    sortable:true, 
                                    formatter:function(value,row){
										return row.deviceName;
									},
									editor:{
										type:'combobox',
										options:{
											data:list_name,
											valueField:'deviceIdd',
											textField:'deviceName',
											panelHeight:'auto' 
										}
									}
                                },  
                                {  
                                    field : 'deviceFaultCause',  
                                    title : '����ԭ��',  
                                    width : 120,  
                                    align : 'center',
                                    sortable:true,  
                                    editor:'text'
                                },
                                {  
                                    field : 'deviceFaultDetail',  
                                    title : '��������',  
                                    width : 200,  
                                    align : 'center',
                                    sortable:true,  
                                    editor:'text'
                                },
                                {  
                                    field : 'deviceFaultDate',  
                                    title : '��������',  
                                    width : 190,  
                                    align : 'center',
                                    sortable:true,  
                                    editor:'datetimebox'
                                },
                                {  
                                    field : 'deviceFaultMaintenance',  
                                    title : 'ά�޷�ʽ',  
                                    width : 120,  
                                    align : 'center',
                                    sortable:true,  
                                   editor:'text'
                                }
                                 ] ],  
                        toolbar : [  
                                {  
                                    id : "deviceFaultEdit",
                                    class:"easyui-linkbutton",  
                                    text : '�༭',  
                                    iconCls : 'icon-edit',
                                    plain:true,  
                                    handler : edit_deviceFault
                                },  
                                {  
                                    id : "deviceFaultAdd",
                                    class:"easyui-linkbutton",  
                                    text : '���',
                                    iconCls:'icon-add',
                                    plain:true,  
                                    handler : append_deviceFault
                                },  
                                {  
                                    id : "deviceFaultRemove",
                                    class:"easyui-linkbutton",  
                                    text : '�Ƴ�',
                                    iconCls:'icon-remove',
                                    plain:true,  
                                    handler : remove_deviceFault
                                },  
                                {  
                                    id : "deviceFaultReject",
                                    class:"easyui-linkbutton",  
                                    text : '����',
                                    iconCls:'icon-undo',
                                    plain:true,  
                                    handler : reject_deviceFault
                                },  
                                {  
                                    id : "deviceFaultSave",
                                    class:"easyui-linkbutton",  
                                    text : '����',
                                    iconCls:'icon-save',
                                    plain:true,  
                                    handler : accept_deviceFault
                                },  
                                {  
                                    id : "deviceFaultGetChanged",
                                    class:"easyui-linkbutton",  
                                    text : '�鿴�ı�',
                                    iconCls:'icon-search', 
                                    plain:true, 
                                    handler : getChanges_deviceFault
                                } ]  
                    }); 		
	});
</script>

<%------------------------------------- $.datagrid----------------------------------------------%>


<%------------------------------------- �ﾳ�˵� ----------------------------------------------%>

<script type="text/javascript">
	$(function() {
		$('#deviceFault').datagrid({
			fitColumns : true,
			onHeaderContextMenu : function(e, field) {
				e.preventDefault();
				if (!deviceFaultContextMenu) {
					createColumnMenu_deviceFault();
				}
				deviceFaultContextMenu.menu('show', {
					left : e.pageX,
				});
			}
		});
	});
	var deviceFaultContextMenu;
	function createColumnMenu_deviceFault() {
		deviceFaultContextMenu = $('<div/>').appendTo('body');
		deviceFaultContextMenu.menu({
			onClick : function(item) {
				if (item.iconCls == 'icon-ok') {
					$('#deviceFault').datagrid('hideColumn', item.name);
					deviceFaultContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					$('#deviceFault').datagrid('showColumn', item.name);
					deviceFaultContextMenu.menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
		var fields = $('#deviceFault').datagrid('getColumnFields');
		for (var i = 1; i < fields.length; i++) {
			var field = fields[i];
			var col = $('#deviceFault').datagrid('getColumnOption', field);
			deviceFaultContextMenu.menu('appendItem', {
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

		var deviceFaultForFilter = $('#deviceFault').datagrid({
			filterBtnIconCls : 'icon-filter'
		});

		deviceFaultForFilter.datagrid('enableFilter', [ {
			field : 'deviceFaultId',
			type : 'text',
			options : {
				precision : -1
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceId',
			type : 'text',
			options : {
				precision : -2
			},
			op : [ 'equal', 'notequal', 'less', 'greater' ]
		}, {
			field : 'deviceFaultDate',
			type : 'datetimebox',
			options : {
				editable : false
			},
			op : [ 'contains', 'equal', 'notequal', 'less', 'greater' ]
		} ]);
	});
</script>

<%------------------------------------- JQuery Easy UI Filter -------------------------------------%>
