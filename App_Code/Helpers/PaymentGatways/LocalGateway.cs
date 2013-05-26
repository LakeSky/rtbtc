using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using meis007Model;
using PayPal;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using PayPal.Api.Payments;

public class LocalGateway
{
  public static PGCreditCard CreateCreditCard(PaypalResponse res, meis007Entities _meis007Entities)
  {
    var userId = CurrentUser.Id();
    CreditCard paypalCC = res.CC;
    PGCreditCard cc = new PGCreditCard
    {
      NameOnCard = paypalCC.first_name + " " + paypalCC.last_name,
      Number = paypalCC.number,
      GatewayId = "CARD",
      UserId = userId,
      CreatedAt = DateTime.Now,
      UpdatedAt = DateTime.Now,
      LPGID = res.PaymentGateway.ID
    };
    _meis007Entities.AddToPGCreditCards(cc);
    _meis007Entities.SaveChanges();
    return cc;
  }

  public static PGTransaction CreateTransaction(PGCreditCard localCC, PaypalResponse res, long basketId, meis007Entities _meis007Entities)
  {
    var userId = CurrentUser.Id();
    Payment payment = res.Pymnt;
    PGTransaction tra = new PGTransaction
    {
      ConfirmationID = payment.id,
      Status = payment.state,
      CreatedAt = DateTime.Now,
      CreditCardId = localCC.Id,
      RawData = JObject.Parse(payment.ConvertToJson()).ToString(Formatting.Indented),
      UserId = userId,
      BasketId = basketId,
      TransType = "sale",
      LPGID = res.PaymentGateway.ID
    };
    _meis007Entities.AddToPGTransactions(tra);
    _meis007Entities.SaveChanges();
    return tra;
  }
}