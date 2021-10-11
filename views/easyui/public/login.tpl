{{template "../public/header.tpl"}}
<script type="text/javascript">
var URL="/public"
    $(function(){
        $("#dialog").dialog({
            closable:false,
            buttons:[{
            text:'登入',
            iconCls:'icon-save',
            handler:function(){
                fromsubmit();
            }
        },{
            text:'重置',
            iconCls:'icon-cancel',
            handler:function(){
                $("#form").from("reset");
            }
        }]
        });
    });
function fromsubmit(){
    $("#form").form('submit',{
        url:URL+'/login?isajax=1',
        onSubmit:function(){
            return $("#form").form('validate');
        },
        success:function(r){
            var r = $.parseJSON( r );
            if(r.status){
                location.href = URL+"/index"
            }else{
                vac.alert(r.info);
            }
        }
    });
}
    //这个就是键盘触发的函数
var SubmitOrHidden = function(evt){
    evt = window.event || evt;
    if(evt.keyCode==13){//如果取到的键值是回车
          fromsubmit();       
     }
                
}
window.document.onkeydown=SubmitOrHidden;//当有键按下时执行函数
</script>
<body>
<div align="center">
    <img src="/static/images/logo.png" />
    <div style="text-align:center;margin:0 auto;width:350px;height:250px;" id="dialog" title="登入">
        <div style="padding:20px 20px 20px 40px;" >
            <form id="form" method="post">
                <table >
                    <tr>
                        <td>用戶名：</td><td><input type="text" class="easyui-validatebox" required="true" name="username" missingMessage="請輸入用戶名"/></td>
                    </tr>
                    <tr>
                        <td>密碼：</td><td><input type="password" class="easyui-validatebox" required="true" name="password" missingMessage="請輸入密碼"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>