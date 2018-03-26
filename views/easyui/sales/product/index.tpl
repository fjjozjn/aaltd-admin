{{template "../../public/header.tpl"}}
<script type="text/javascript">
	//打开新增product页面
    function add_product(){
        window.open('http://aaltd-invoice.cxm/sys/?act=com-addproduct_new','my_iframe');
    }
</script>	
<body>
<table id="treegrid" title="產品管理" class="easyui-treegrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <!-- <input id="group"/> -->
    <a href="#" icon='icon-add' plain="true" onclick="add_product()" class="easyui-linkbutton" >新增</a>
</div>
<iframe name="my_iframe" frameborder="no" src="http://aaltd-invoice.cxm/sys/?act=com-searchproduct_new&page=1" width="100%" height="800px" scrolling="auto"></iframe>
</body>
</html>