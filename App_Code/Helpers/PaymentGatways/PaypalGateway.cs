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
  public static Address AssignAddress(string adrs, string city, string state, string country, string postalCode) {
    Address billingAddress = new Address();
    billingAddress.line1 = adrs;
    billingAddress.city = city;
    billingAddress.state = state;
    billingAddress.country_code = country;
    billingAddress.postal_code = postalCode;

    billingAddress = new Address();
    billingAddress.city = "Johnstown";
    billingAddress.country_code = "US";
    billingAddress.line1 = "52 N Main ST";
    billingAddress.postal_code = "43210";
    billingAddress.state = "OH";

    return billingAddress;
  }

  public static CreditCard AssignCVV(Address adrs, string number, string cvv, string firstName, string lastName, string exMonth, string exYear, string type) {
    CreditCard crdtCard = new CreditCard();
    crdtCard.billing_address = adrs;
    crdtCard.number = number;
    crdtCard.cvv2 = cvv;
    crdtCard.first_name = firstName;
    crdtCard.last_name = lastName;
    crdtCard.expire_month = exMonth;
    crdtCard.expire_year = exYear;
    crdtCard.type = type;
    return crdtCard;
  }

  public static PaypalResponse CreateCreditCard(CreditCard cc, string amount)
  {
    bool valid = true;
    var paymentGateway = DbParameter.GetGateway("paypal", null);
    var customAmount = amount.Split('.')[0];
    Payment createdPayment = null;
    AmountDetails amntDetails = new AmountDetails();
    amntDetails.shipping = "0";
    amntDetails.subtotal = customAmount;
    amntDetails.tax = "0";

    Amount amnt = new Amount();
    amnt.currency = "USD";
    amnt.total = customAmount;
    amnt.details = amntDetails;

    Transaction tran = new Transaction();
    tran.amount = amnt;
    tran.description = string.Empty;

    List<Transaction> transactions = new List<Transaction>();
    transactions.Add(tran);

    FundingInstrument fundInstrument = new FundingInstrument();
    fundInstrument.credit_card = cc;

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
    }
    catch (PayPal.Exception.PayPalException ex)
    {
      valid = false;
    }
    PaypalResponse res = new PaypalResponse { 
      Valid = valid,
      CC = cc,
      PaymentGateway = paymentGateway,
      Pymnt = createdPayment
    };
    return res;
  }
}