using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal;
using PayPal.Manager;
using PayPal.Api.Payments;
using meis007Model;

/// <summary>
/// Summary description for PaypalResponse
/// </summary>
public class PaypalResponse
{
  public PGMaster PaymentGateway { get; set; }
  public PayPal.Api.Payments.CreditCard CC { get; set; }
  public PayPal.Api.Payments.Payment Pymnt { get; set; }
  public bool Valid { get; set; }
}