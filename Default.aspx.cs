using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal;
using PayPal.Manager;
using PayPal.Api.Payments;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      HttpContext CurrContext = HttpContext.Current;
      Address billingAddress = new Address();
      billingAddress.city = "Johnstown";
      billingAddress.country_code = "US";
      billingAddress.line1 = "52 N Main ST";
      billingAddress.postal_code = "43210";
      billingAddress.state = "OH";

      CreditCard crdtCard = new CreditCard();
      crdtCard.billing_address = billingAddress;
      crdtCard.cvv2 = "874";
      crdtCard.expire_month = "11";
      crdtCard.expire_year = "2018";
      crdtCard.first_name = "Joe";
      crdtCard.last_name = "Shopper";
      crdtCard.number = "4417119669820331";
      crdtCard.type = "visa";

      AmountDetails amntDetails = new AmountDetails();
      amntDetails.shipping = "1";
      amntDetails.subtotal = "5";
      amntDetails.tax = "1";

      Amount amnt = new Amount();
      amnt.currency = "USD";
      // Total must be equal to sum of shipping, tax and subtotal.
      amnt.total = "7";
      amnt.details = amntDetails;

      Transaction tran = new Transaction();
      tran.amount = amnt;
      tran.description = "This is the payment transaction description.";

      List<Transaction> transactions = new List<Transaction>();
      transactions.Add(tran);

      FundingInstrument fundInstrument = new FundingInstrument();
      fundInstrument.credit_card = crdtCard;

      List<FundingInstrument> fundingInstrumentList = new List<FundingInstrument>();
      fundingInstrumentList.Add(fundInstrument);

      Payer payr = new Payer();
      payr.funding_instruments = fundingInstrumentList;
      payr.payment_method = "credit_card";

      Payment pymnt = new Payment();
      pymnt.intent = "sale";
      pymnt.payer = payr;
      pymnt.transactions = transactions;

      try
      {
        string accessToken = new OAuthTokenCredential(ConfigManager.Instance.GetProperties()["ClientID"], ConfigManager.Instance.GetProperties()["ClientSecret"]).GetAccessToken();

        APIContext apiContext = new APIContext(accessToken);
        Payment createdPayment = pymnt.Create(apiContext);
        var xy = JObject.Parse(createdPayment.ConvertToJson()).ToString(Formatting.Indented);
        CurrContext.Items.Add("ResponseJson", JObject.Parse(createdPayment.ConvertToJson()).ToString(Formatting.Indented));
        var x = createdPayment.payer.funding_instruments[0].credit_card;
        var y = createdPayment.payer.funding_instruments[0].credit_card_token;
      }
      catch (PayPal.Exception.PayPalException ex)
      {
        CurrContext.Items.Add("Error", ex.Message);
      }
      CurrContext.Items.Add("RequestJson", JObject.Parse(pymnt.ConvertToJson()).ToString(Formatting.Indented));

      Server.Transfer("~/About.aspx");
    }
}
