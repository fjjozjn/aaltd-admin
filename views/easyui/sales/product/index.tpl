{{template "../../public/header.tpl"}}
<script type="text/javascript">
    function add(){
        window.open('{{.invoice_system_host}}sys/?act=com-addproduct_new','my_iframe');
    }

    function find(){
        window.open('{{.invoice_system_host}}sys/?act=com-searchproduct_new&page=1','my_iframe');
    }

    function changeFrameHeight(){
        var ifm= document.getElementById("my_iframe");
        ifm.height=document.documentElement.clientHeight - 60;//60是头部高度（这里直接减60是临时做法）
    }

    window.onload=function(){
        changeFrameHeight();
    }

    window.onresize=function(){
        changeFrameHeight();
    }
</script>	
<body>
<table id="treegrid" class="easyui-treegrid" toolbar="#tb"></table>
<div id="tb" style="padding:5px;height:auto">
    <!-- <input id="group"/> -->
    <a href="#" icon='icon-add' plain="true" onclick="add()" class="easyui-linkbutton" >新增</a>
    <a href="#" icon='icon-reload' plain="true" onclick="find();" class="easyui-linkbutton" >返回</a>
</div>
<iframe id="my_iframe" name="my_iframe" frameborder="no" src="{{.invoice_system_host}}sys/?act=com-searchproduct_new&page=1" width="100%" height="960px" scrolling="auto"></iframe>
</body>
</html>