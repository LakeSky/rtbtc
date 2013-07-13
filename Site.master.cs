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
    public B2CCustomerinfo b2CCustomerinfo;
    public string UserName;
    protected meis007Entities _meis007Entities;
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
        if (Page.User.Identity.IsAuthenticated)
        {
            _meis007Entities = new meis007Entities();
            var _currentUserId = CurrentUser.Id();
            b2CCustomerinfo = _meis007Entities.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First();
            UserName = b2CCustomerinfo.PaxFirstName;
        }

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
            Session["MasterCurrencySelectedValue"] = ApplicationObject.GetBaseCurrency();
            Session["MasterCurrency"] = list;
        }
        return list;
    }

    protected void BindMasterCurrencyDropDown() {
        var selectedValue = GetMasterCurrencySelectedValue();
        var list = GetCurrencies();
        hdnMasterCurrencySelectedValue.Value = selectedValue;
        rptrCurrencies.DataSource = list;
        rptrCurrencies.DataBind();
    }

    protected string GetMasterCurrencySelectedValue() {
        var selectedValue = (string)(Session["MasterCurrencySelectedValue"]);
        if (string.IsNullOrEmpty(selectedValue)) {
            selectedValue = ApplicationObject.GetBaseCurrency();
        }
        return selectedValue;
    }

    protected string MasterCurrnecySelectedValue()
    {
        return ApplicationObject.GetMasterCurrency(ApplicationObject.GetBaseCurrency());
    }
}
