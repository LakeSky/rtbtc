using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Payfort_Response
{
    public bool Status { get; set; }
    public string ErrorMessage { get; set; }
    public string OrderId { get; set; }
    public string PayId { get; set; }
    public string PayIdSub { get; set; }
    public string Acceptence { get; set; }
    public string Xml { get; set; }
    public string TotalAmount { get; set; }
    public string TotalRefundAmount { get; set; }
}