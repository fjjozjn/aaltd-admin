{{template "../../public/header.tpl"}}
<script type="text/javascript">
	//打开新增product页面
    function add_product(){
        window.open('{{.SysUrl}}?act=com-addproduct_new','my_iframe');
    }

    function refreshFrame(){
        document.getElementById('my_iframe').contentWindow.location.reload(true);
    }
</script>	
<body>
<table id="treegrid" title="產品管理" class="easyui-treegrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <!-- <input id="group"/> -->
    <a href="#" icon='icon-add' plain="true" onclick="add_product()" class="easyui-linkbutton" >新增{{.invoice_system_url}}</a>
    <a href="#" icon='icon-reload' plain="true" onclick="javascript:refreshFrame();" class="easyui-linkbutton" >返回</a>
</div>
<iframe id="my_iframe" name="my_iframe" frameborder="no" src="{{.SysUrl}}?act=com-searchproduct_new&page=1" width="100%" height="800px" scrolling="auto"></iframe>
</body>
</html>