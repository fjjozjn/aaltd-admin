{{template "../../public/header.tpl"}}
<script type="text/javascript">
	//打开新增product页面
    function add(){
        window.open('{{.invoice_system_host}}sys/?act=com-addproforma','my_iframe');
    }

    function search(){
        window.open('{{.invoice_system_host}}sys/?act=com-searchproforma&page=1','my_iframe');
    }
</script>	
<body>
<table id="treegrid" title="PROFORMA" class="easyui-treegrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <!-- <input id="group"/> -->
    <a href="#" icon='icon-add' plain="true" onclick="add()" class="easyui-linkbutton" >新增</a>
    <a href="#" icon='icon-reload' plain="true" onclick="search();" class="easyui-linkbutton" >返回</a>
</div>
<iframe id="my_iframe" name="my_iframe" frameborder="no" src="{{.invoice_system_host}}sys/?act=com-searchproforma&page=1" width="100%" height="800px" scrolling="auto"></iframe>
</body>
</html>