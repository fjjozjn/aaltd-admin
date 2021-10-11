{{template "../public/header.tpl"}}
<script type="text/javascript">
var URL="/public"
    $( function() {
        //生成树
        $("#tree").tree({
            url:URL+'/index',
            onClick:function(node){
                if(node.attributes.url == ""){
                    $(this).tree("toggle",node.target);
                    return false;
                }
                var href = node.attributes.url;
                var tabs = $("#tabs");
                if(href){
                    var content = '<iframe scrolling="auto" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';
                }else{
                    var content = '未实现';
                }
                //已经存在tabs则选中它
                if(tabs.tabs('exists',node.text)){
                    //选中
                    tabs.tabs('select',node.text);
                    //refreshTab(node.text);
                }else{
                    //添加
                    tabs.tabs('add',{
                        title:node.text,
                        content:content,
                        closable:true,
                        cache:false,
                        fit:'true'
                    });
                }
            }
        });
        $("#tabs").tabs({
            width: $("#tabs").parent().width(),
            height: "auto",
            fit:true,
            border:false,
            onContextMenu : function(e, title) {
                e.preventDefault();
                $("#mm").menu('show', {
                    left : e.pageX,
                    top : e.pageY
                }).data('tabTitle', title);
            }
        });
        $('#mm').menu({
            onClick : function(item) {
                var curTabTitle = $(this).data('tabTitle');
                var type = $(item.target).attr('type');

                if (type === 'refresh') {
                    refreshTab(curTabTitle);
                    return;
                }

                if (type === 'close') {
                    var t = $("#tabs").tabs('getTab', curTabTitle);
                    if (t.panel('options').closable) {
                        $("#tabs").tabs('close', curTabTitle);
                    }
                    return;
                }

                var allTabs = $("#tabs").tabs('tabs');
                var closeTabsTitle = [];

                $.each(allTabs, function() {
                    var opt = $(this).panel('options');
                    if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
                        closeTabsTitle.push(opt.title);
                    } else if (opt.closable && type === 'closeAll') {
                        closeTabsTitle.push(opt.title);
                    }
                });
                for ( var i = 0; i < closeTabsTitle.length; i++) {
                    $("#tabs").tabs('close', closeTabsTitle[i]);
                }
            }
        });
        //修改配色方案
        $("#changetheme").change(function(){
            var theme = $(this).val();
            $.cookie("theme",theme); //新建cookie
            location.reload();
        });
        //设置已选theme的值
//        var themed = $.cookie('theme');
//        if(themed){
//            $("#changetheme").val(themed);
//        }
    });
    function refreshTab(title) {
        var tab = $("#tabs").tabs("getTab", title);
        $("#tabs").tabs("update", {tab: tab, options: tab.panel("options")});
    }
    function expand(){
        $('#tree').tree('expandAll');
    }
    function collapse(){
        $('#tree').tree('collapseAll');
    }
    function modifypassword(){
        $("#dialog").dialog({
            modal:true,
            title:"修改密码",
            width:400,
            height:250,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    $("#form1").form('submit',{
                        url:URL+'/changepwd',
                        onSubmit:function(){
                            return $("#form1").form('validate');
                        },
                        success:function(r){
                            var r = $.parseJSON( r );
                            if(r.status){
                                $.messager.alert("提示", r.info,'info',function(){
                                    location.href = URL+"/logout";
                                });
                            }else{
                                vac.alert(r.info);
                            }
                        }
                    });
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dialog").dialog("close");
                }
            }]
        });
    }
    //选择分组
    function selectgroup(group_id){
        $(this).addClass("current");
        vac.ajax(URL+'/index', {group_id:group_id}, 'GET', function(data){
            $("#tree").tree("loadData",data)
        })

    }
</script>

<style>
.ht_nav {
    float: left;
    overflow: hidden;
    padding: 0 0 0 10px;
    margin: 0;
}
.ht_nav li{
    font:700 16px/2.5 'microsoft yahei';
    float: left;
    list-style-type: none;
    margin-right: 10px;

}
.ht_nav li a{
    text-decoration: none;
    color:#333;
}
.ht_nav li a.current, .ht_nav li a:hover{
    color:#F20;

}
</style>
<body class="easyui-layout" style="text-align:left">
<div region="north" border="false" style="overflow: hidden; width: 100%; height:82px; background:#D9E5FD;">
    <div style="overflow: hidden; width:400px; padding:2px 0 0 5px;">
        <h2>Sparkling Bright Ltd.</h2>
    </div>
    <!-- ul class="ht_nav">
        {{range .groups}}
            <li><span><a class="current"  href="#" onClick="selectgroup({{.Id}});$('.ht_nav li a').removeClass('current');$(this).addClass('current')">{{.Title}}</a></span></li>
        {{end}}
    </ul -->
    <div id="header-inner" style="float:right; overflow:hidden; height:80px; width:300px; line-height:25px; text-align:right; padding-right:20px;margin-top:-50px; ">
        歡迎你！ {{.userinfo.Nickname}} <a href="javascript:void(0);" onclick="modifypassword()"> 修改密碼</a>
        <a href="/public/logout" target="_parent"> 退 出</a>
    </div>
</div>
<div id="dialog" >
    <div style="padding:20px 20px 40px 80px;" >
        <form id="form1" method="post">
            <table>
                <tr>
                    <td>舊密碼</td>
                    <td><input type="password"  name="oldpassword" class="easyui-validatebox"  required="true" validType="password[5,20]" missingMessage="請填寫當前使用的密碼"/></td>
                </tr>
                <tr>
                    <td>新密碼：</td>
                    <td><input type="password"  name="newpassword" class="easyui-validatebox" required="true" validType="password[5,20]" missingMessage="請填寫需要修改的密碼"  /></td>
                </tr>
                <tr>
                    <td>重複密碼：</td>
                    <td><input type="password"  name="repeatpassword"  class="easyui-validatebox" required="true" validType="password[5,20]" missingMessage="請重複填寫需要修改的密碼" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</div>
<div region="west" border="false" split="true" title="菜單"  tools="#toolbar" style="width:200px;padding:5px;">
    <ul id="tree"></ul>
</div>
<div region="center" border="false" >
    <div id="tabs" >
    </div>
</div>
<div id="toolbar">
    <a href="#" class="icon-expand" title="全部展開" onclick="expand()"></a>
    <a href="#" class="icon-collapse" title="全部關閉" onclick="collapse()"></a>
</div>
<!--右键菜单-->
<div id="mm" style="width: 120px;display:none;">
    <div iconCls='icon-reload' type="refresh">刷新</div>
    <div class="menu-sep"></div>
    <div  type="close">關閉</div>
    <div type="closeOther">關閉其他</div>
    <div type="closeAll">關閉所有</div>
</div>
<iframe width="0" height="0" src="{{.invoice_system_host}}auth/auth.php?aAdminEmail={{.userinfo.Email}}&aFtyName={{.userinfo.Username}}&aID={{.userinfo.Id}}&aLogin={{.userinfo.Username}}&aName={{.userinfo.Username}}&aNameChi={{.userinfo.Nickname}}"></iframe>
</body>
</html>