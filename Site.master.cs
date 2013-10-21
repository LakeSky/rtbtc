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
    protected meis007Entities _entity;
    protected string rootPath;
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
        if (!IsPostBack)
        {
            rootPath = Route.GetRootPath(string.Empty);
            if (Page.User.Identity.IsAuthenticated)
            {
                logged_in_div.Visible = true;
                log_out_div.Visible = false;
                logged_in_account_link.HRef = rootPath + "currentuser/myaccount.aspx";
                logged_in_text.InnerHtml = "<b>Welcome, "+ GetUserName() +"</b>&nbsp;&nbsp; My Account";
                log_out_link.HRef = rootPath + "account/logout.aspx";
            }
            else
            {
                logged_in_div.Visible = false;
                log_out_div.Visible = true;
                create_account_link.HRef = rootPath + "account/register.aspx";
                log_in_link.HRef = rootPath + "account/login.aspx";
                forgot_password_link.HRef = rootPath + "account/forgotpassword.aspx";
            }
        }
    }

   protected List<CurrencyHelper> GetCurrencies() {
        var list = (List<CurrencyHelper>)(Session["MasterCurrency"]);
        if (list == null)
        {
            GetEntity();
            list = new List<CurrencyHelper>();
            CurrencyHelper currencyHelper;
            foreach (var x in _entity.CurrencyMasters.Where(x => x.IsVisibleB2C == true)) {
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

    protected string GetUserName()
    {
        if (Session["userName"] != null)
        {
            return Session["userName"].ToString();
        }
        var _currentUserId = CurrentUser.Id();
        GetEntity();
        return _entity.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First().PaxFirstName;
    }

    protected void GetEntity()
    {
        if (_entity == null)
        {
            _entity = new meis007Entities();
        }
    }
}
