using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class Payfort : System.Web.UI.MasterPage
{
    public int basketItemsCount;
    public BasketHelper masterBasketHelper;
    public B2CCustomerinfo b2CCustomerinfo;
    public string UserName, rootPath;
    protected meis007Entities _entity;
    protected void Page_Load(object sender, EventArgs e)
    {
        rootPath = Route.GetRootPath(string.Empty);
        if (!IsPostBack)
        {
            BindMasterCurrencyDropDown();
            BindBasket();
            BindLogo();
            BindNavigation();
            BindFooter();
            if (Page.User.Identity.IsAuthenticated)
            {
                logged_in_div.Visible = true;
                log_out_div.Visible = false;
                logged_in_account_link.HRef = rootPath + "currentuser/myaccount.aspx";
                logged_in_text.InnerHtml = "<b>Welcome, " + GetUserName() + "</b>&nbsp;&nbsp; My Account";
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

    protected List<CurrencyHelper> GetCurrencies()
    {
        var list = (List<CurrencyHelper>)(Session["MasterCurrency"]);
        if (list == null)
        {
            GetEntity();
            list = new List<CurrencyHelper>();
            CurrencyHelper currencyHelper;
            foreach (var x in _entity.CurrencyMasters.Where(x => x.IsVisibleB2C == true))
            {
                currencyHelper = new CurrencyHelper
                {
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

    protected void BindMasterCurrencyDropDown()
    {
        var selectedValue = GetMasterCurrencySelectedValue();
        var list = GetCurrencies();
        hdnMasterCurrencySelectedValue.Value = selectedValue;
        rptrCurrencies.DataSource = list;
        rptrCurrencies.DataBind();
    }

    protected string GetMasterCurrencySelectedValue()
    {
        var selectedValue = (string)(Session["MasterCurrencySelectedValue"]);
        if (string.IsNullOrEmpty(selectedValue))
        {
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
        Session["userName"] = _entity.B2CCustomerinfo.Where(x => x.CustomerSNo == _currentUserId).First().PaxFirstName;
        return Session["userName"].ToString();
    }

    protected void GetEntity()
    {
        if (_entity == null)
        {
            _entity = new meis007Entities();
        }
    }

    protected void BindBasket()
    {
        basketItemsCount = 0;
        masterBasketHelper = (BasketHelper)(Session["Basket"]);
        if (masterBasketHelper != null)
        {
            basketItemsCount = masterBasketHelper.hotelDetails.Count();
            basketItemsCount += masterBasketHelper.packageDetails.Count;
        }
        cart_header_count.InnerText = basketItemsCount.ToString();
        if (basketItemsCount == 0)
        {
            totalBasketItems.Visible = false;
            basketButtons.Visible = false;
            emptyBasketItems.Visible = true;
            emptyBasketItems.InnerText = "Your shopping cart is empty!";
        }
        else
        {
            emptyBasketItems.Visible = false;
            rptrCartPackages.DataSource = masterBasketHelper.packageDetails;
            rptrCartPackages.DataBind();
            rptrCartHotels.DataSource = masterBasketHelper.hotelDetails;
            rptrCartHotels.DataBind();
            totalBasketItems.Visible = true;
            totalBasketItems.InnerHtml = "<span class='productSpecialPrice'>" +
                ApplicationObject.GetMasterCurrency(GetMasterCurrencySelectedValue()) +
                "&nbsp;<span id='cart_header_amount'>" +
                ApplicationObject.FormattedCurrencyDisplayPrice(masterBasketHelper.totalPrice, GetMasterCurrencySelectedValue()) +
                "</span></span>";
            basketButtons.Visible = true;
            basketButtons.InnerHtml =
                "<strong class='button_content button_content2'>" +
                "<strong class='button bg_button' style='margin-left: 0;'>" +
                "<a href='" + rootPath + "basket/show.aspx" + "'>" +
                "<span class='ui-button-text'>Shopping cart</span>" +
                "</a>" +
                "</strong>" +
                "</strong>" +
                "<strong class='button_content button_content1'>" +
                "<strong class='button bg_button' style='margin-left: 35px;'>" +
                "<a href='" + rootPath + "orders/checkout.aspx" + "'>" +
                "<span class='ui-button-text'>Checkout</span>" +
                "</a>" +
                "</strong>" +
                "</strong>";
        }
    }

    protected void BindLogo()
    {
        storeLogo.HRef = rootPath + "home.aspx";
        storeLogo.InnerHtml = "<img src='" + rootPath + "images/all3.png" + "' alt='Riyadh Travels' title='' width='455px' height='111' />";
    }

    protected void BindNavigation()
    {
        rptrHeaderNavigation.DataSource = NavigationData.Get(rootPath);
        rptrHeaderNavigation.DataBind();
    }

    protected void BindFooter()
    {
        footerDiv.InnerHtml = "<p>" +
                             "<a href='" + rootPath + "home.aspx" + "'>Riyadh Travels</a>&nbsp;&nbsp; &copy;" +
                             DateTime.Now.Year +
                             "</p>";
    }
}
