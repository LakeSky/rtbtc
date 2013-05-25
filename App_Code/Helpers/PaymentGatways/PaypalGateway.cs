using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal;
using PayPal.Manager;
using PayPal.Api.Payments;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

/// <summary>
/// Summary description for PaypalGateway
/// </summary>
public class PaypalGateway
{
  public Address billingAddress;
  public PayPal.Api.Payments.CreditCard creditCard;
  string totalAmount;
  Payment createdPayment;
  public PaypalGateway(Address adrs, PayPal.Api.Payments.CreditCard cc, string amount)
	{
    billingAddress = adrs;
    creditCard = cc;
    creditCard.billing_address = billingAddress;
    totalAmount = amount;
	}

  public Payment Pay()
  {
    AmountDetails amntDetails = new AmountDetails();
    amntDetails.shipping = "0";
    amntDetails.subtotal = totalAmount;
    amntDetails.tax = "0";

    Amount amnt = new Amount();
    amnt.currency = "USD";
    // Total must be equal to sum of shipping, tax and subtotal.
    amnt.total = totalAmount;
    amnt.details = amntDetails;

    Transaction tran = new Transaction();
    tran.amount = amnt;
    tran.description = string.Empty;

    List<Transaction> transactions = new List<Transaction>();
    transactions.Add(tran);

    FundingInstrument fundInstrument = new FundingInstrument();
    fundInstrument.credit_card = creditCard;

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
      createdPayment = pymnt.Create(apiContext);
      var xy = JObject.Parse(createdPayment.ConvertToJson()).ToString(Formatting.Indented);
      //CurrContext.Items.Add("ResponseJson", JObject.Parse(createdPayment.ConvertToJson()).ToString(Formatting.Indented));
      var x = createdPayment.payer.funding_instruments[0].credit_card;
      var y = createdPayment.payer.funding_instruments[0].credit_card_token;
    }
    catch (PayPal.Exception.PayPalException ex)
    {
      //CurrContext.Items.Add("Error", ex.Message);
    }
    //CurrContext.Items.Add("RequestJson", JObject.Parse(pymnt.ConvertToJson()).ToString(Formatting.Indented));
    return createdPayment;
  }
}