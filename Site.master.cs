using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    public bool hasBasketItems;
    public int basketItemsCount;
    public BasketHelper masterBasketHelper;
    protected void Page_Load(object sender, EventArgs e)
    {
        hasBasketItems = false;
        basketItemsCount = 0;
        masterBasketHelper = (BasketHelper)(Session["Basket"]);
        if (masterBasketHelper != null) {
            basketItemsCount = masterBasketHelper.hotelDetails.Count();
            basketItemsCount += masterBasketHelper.packageDetails.Count;
        }
        hasBasketItems = basketItemsCount == 0 ? false : true;
        if (!IsPostBack)
        {
            BindMasterCurrencyDropDown();
        }
    }

    protected void ddlMasterCurency_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["MasterCurrencySelectedValue"] = ddlMasterCurency.SelectedValue;
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected List<CurrencyHelper> GetCurrencies() {
        var list = (List<CurrencyHelper>)(Session["MasterCurrency"]);
        if (list == null)
        {
            meis007Entities _meis007Entities = new meis007Entities();
            list = new List<CurrencyHelper>();
            CurrencyHelper currencyHelper;
            foreach (var x in _meis007Entities.CurrencyMasters.Where(x => x.IsVisibleB2C == true)) {
                currencyHelper = new CurrencyHelper { 
                    Id = x.CurID,
                    Text = x.CurID
                };
                list.Add(currencyHelper);
            }
            Session["MasterCurrencySelectedValue"] = list.First().Id;
            Session["MasterCurrency"] = list;
        }
        return list;
    }

    protected void BindMasterCurrencyDropDown() {
        var selectedValue = GetMasterCurrencySelectedValue();
        var list = GetCurrencies();
        ddlMasterCurency.DataSource = list;
        ddlMasterCurency.DataTextField = "Text";
        ddlMasterCurency.DataValueField = "Id";
        ddlMasterCurency.SelectedValue = string.IsNullOrEmpty(selectedValue) ? null : selectedValue ;
        ddlMasterCurency.DataBind();
    }

    protected string GetMasterCurrencySelectedValue() {
        var selectedValue = (string)(Session["MasterCurrencySelectedValue"]);
        if (string.IsNullOrEmpty(selectedValue)) {
            selectedValue = "";
        }
        return selectedValue;
    }
}
