package routers

import (
	"aaltd/controllers"
	"github.com/astaxie/beego"
        "github.com/beego/admin"  //admin 包
)

func init() {
    admin.Run()
    beego.Router("/", &controllers.MainController{})
}
