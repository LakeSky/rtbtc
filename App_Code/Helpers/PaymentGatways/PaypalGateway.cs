using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal;
using PayPal.Manager;
using PayPal.Api.Payments;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using meis007Model;

/// <summary>
/// Summary description for PaypalGateway
/// </summary>
public class PaypalGateway
{
  public CreditCardToken credCardToken;
  string totalAmount;
  Payment createdPayment;
  PGMaster paymentGateway;
  public PaypalGateway(PGMaster pgm, PGCreditCard cc, string amount)
	{
    paymentGateway = pgm;
    totalAmount = int.Parse(amount.Split('.')[0]).ToString();
    credCardToken = new CreditCardToken();
    credCardToken.credit_card_id = cc.GatewayId;
    createdPayment = null;
	}

  public static PaypalResponse CreateCreditCard(string number, string cvv, string type, string expirationMonth, string expirationYear, string billingAddress, string postalCode, string billingCity, string billingCountry)
  {
    bool valid = true;
    PayPal.Api.Payments.Address address = new PayPal.Api.Payments.Address { 
      line1 = billingAddress,
      city = billingCity,
      state = billingCity,
      country_code = billingCountry,
      postal_code = postalCode
    };
    PayPal.Api.Payments.CreditCard credtCard = new PayPal.Api.Payments.CreditCard();
    credtCard.expire_month = expirationMonth;
    credtCard.expire_year = expirationYear;
    credtCard.number = number;
    credtCard.type = type;
    credtCard.billing_address = address;
    //credtCard.cvv2 = cvv;
    PayPal.Api.Payments.CreditCard createdCreditCard = null;
    var paymentGateway = DbParameter.GetGateway("paypal", null);
    try
    {
      string accessToken = new OAuthTokenCredential(paymentGateway.GatewayUserID, paymentGateway.GatewayPWD).GetAccessToken();
      APIContext apiContext = new APIContext(accessToken);
      createdCreditCard = credtCard.Create(apiContext);
      if (createdCreditCard.state != "ok")
      {
        valid = false;
      }
    }
    catch (PayPal.Exception.PayPalException ex)
    {
      valid = false;
    }
    PaypalResponse res = new PaypalResponse { 
      Valid = valid,
      CC = createdCreditCard,
      PaymentGateway = paymentGateway
    };
    return res;
  }

  public PaypalResponse Pay()
  {
    bool valid = true;

    AmountDetails amntDetails = new AmountDetails();
    amntDetails.shipping = "0";
    amntDetails.subtotal = totalAmount;
    amntDetails.tax = "0";

    Amount amnt = new Amount();
    amnt.currency = "USD";
    amnt.total = totalAmount;
    amnt.details = amntDetails;

    PayPal.Api.Payments.Transaction tran = new PayPal.Api.Payments.Transaction();
    tran.amount = amnt;
    tran.description = string.Empty;

    List<PayPal.Api.Payments.Transaction> transactions = new List<PayPal.Api.Payments.Transaction>();
    transactions.Add(tran);

    FundingInstrument fundInstrument = new FundingInstrument();
    fundInstrument.credit_card_token = credCardToken;

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
      var x = createdPayment.payer.funding_instruments[0].credit_card;
      var y = createdPayment.payer.funding_instruments[0].credit_card_token;
    }
    catch (PayPal.Exception.PayPalException ex)
    {
      valid = false;
    }
    PaypalResponse res = new PaypalResponse { 
      Valid = valid,
      Pymnt = createdPayment,
      PaymentGateway = paymentGateway
    };
    return res;
  }
}