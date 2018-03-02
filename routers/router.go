package routers

import (
	"fjjozjn/aaltd-admin/controllers"
	"github.com/astaxie/beego"
    "fjjozjn/admin"  //admin 包
)

func init() {
    admin.Run()
    beego.Router("/", &controllers.MainController{})
}
