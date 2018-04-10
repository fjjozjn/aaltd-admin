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
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/product/index.tpl"
}

func (c *MainController) ProformaIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/proforma/index.tpl"
}

func (c *MainController) InvoiceIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/invoice/index.tpl"
}