package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = ""
	c.Data["Email"] = ""
	c.TplName = "index.tpl"
}

func (c *MainController) ProductIndex() {
	c.Data["SysUrl"] = beego.AppConfig.String("invoice_system_url")
	c.TplName = "easyui/sales/product/index.tpl"
}