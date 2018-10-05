package routers

import (
	"fjjozjn/aaltd-admin/controllers"
	"github.com/astaxie/beego"
    "fjjozjn/admin"  //admin 包
)

func init() {
    admin.Run()
    beego.Router("/", &controllers.MainController{})
    beego.Router("/sales/product/index", &controllers.MainController{}, "*:ProductIndex")
    beego.Router("/sales/proforma/index", &controllers.MainController{}, "*:ProformaIndex")
    beego.Router("/sales/invoice/index", &controllers.MainController{}, "*:InvoiceIndex")
    beego.Router("/sales/packing/index", &controllers.MainController{}, "*:PackingIndex")
    beego.Router("/sales/customer/index", &controllers.MainController{}, "*:CustomerIndex")
    beego.Router("/purchasing/purchase/index", &controllers.MainController{}, "*:PurchaseIndex")
    beego.Router("/purchasing/supplier/index", &controllers.MainController{}, "*:SupplierIndex")
}
