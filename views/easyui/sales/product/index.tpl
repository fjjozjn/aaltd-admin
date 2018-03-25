{{template "../../public/header.tpl"}}
<script type="text/javascript">
	//刷新
    function reloadrow(){
        $("#treegrid").treegrid("reload");
    }
</script>	
<body>
<table id="treegrid" title="產品管理" class="easyui-treegrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <!-- <input id="group"/> -->
    <a href="#" icon='icon-add' plain="true" onclick="addrow()" class="easyui-linkbutton" >新增</a>
    <a href="#" icon='icon-reload' plain="true" onclick="reloadrow()" class="easyui-linkbutton" >刷新</a>
</div>
<iframe src="http://aaltd-invoice.cxm/sys/?act=com-searchproduct_new&page=1" width="100%" height="800px" scrolling="auto"></iframe>
</body>
</html>