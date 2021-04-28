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

func (c *MainController) QuotationIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/quotation/index.tpl"
}

func (c *MainController) ProformaIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/proforma/index.tpl"
}

func (c *MainController) InvoiceIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/invoice/index.tpl"
}

func (c *MainController) PackingIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/packing/index.tpl"
}

func (c *MainController) CustomerIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/sales/customer/index.tpl"
}

func (c *MainController) PurchaseIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/purchasing/purchase/index.tpl"
}

func (c *MainController) SupplierIndex() {
	c.Data["invoice_system_host"] = beego.AppConfig.String("invoice_system_host")
	c.TplName = "easyui/purchasing/supplier/index.tpl"
}