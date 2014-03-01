using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders_error : System.Web.UI.Page
{
    Payfort_Response obj;
    string errorValue, errorCode, queryString;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new Payfort_Response();
        obj.Status = false;
        obj.OrderId = Request.QueryString["OrderID"];
        obj.ErrorMessage = string.Empty;
        errorCode = Request.QueryString["NCErrorCN"];
        NCE_ERROR_CN();
        obj.ErrorMessage += errorValue;
        errorCode = Request.QueryString["NCErrorCardNo"];
        NC_ERROR_CARDNO();
        obj.ErrorMessage += errorValue;
        errorCode = Request.QueryString["NCErrorCVC"];
        NC_ERROR_CVC();
        obj.ErrorMessage += errorValue;
        errorCode = Request.QueryString["NCErrorED"];
        NC_ERROR_ED();
        obj.ErrorMessage += errorValue;
        errorCode = Request.QueryString["NCError"];
        NCE_ERROR();
        //obj.ErrorMessage += errorValue;
        obj.ErrorMessage += "Please correct the errors";
        Session["Payfort_Response"] = obj;
        Response.Redirect("checkout.aspx");
    }

    void NCE_ERROR()
    {
        errorValue = string.Empty;
        switch (errorCode)
        {
            case "5555554":
                errorValue = "Incorrect ORDERID (after resubmission)";
                break;
            case "55555555":
                errorValue = "General error.<br/>";
                break;
            case "50001184":
                errorValue = "SHA_IN mismatch.<br/>";
                break;
            case "50001186":
                errorValue = "*Operation not allowed (when the merchant sends an ORDERID for which an alias already exists).<br/>";
                break;
            case "50001187":
                errorValue = "*Operation not allowed(when the merchant sends an alias that already exists).<br/>";
                break;
            case "50001300":
                errorValue = "Wrong brand specified (Direct Debits).<br/>";
                break;
            case "50001301":
                errorValue = "Wrong bank account format (Direct Debits).<br/>";
                break;
        }
    }

    void NCE_ERROR_CN()
    {
        errorValue = string.Empty;
        switch (errorCode)
        {
            case "60001057":
                errorValue = "Name is missing.<br/>";
                break;
            case "50001174":
                errorValue = "Name is too long.<br/>";
                break;
        }
    }

    void NC_ERROR_CARDNO()
    {
        errorValue = string.Empty;
        switch (errorCode)
        {
            case "30141001":
                errorValue = "Invalid card number.<br/>";
                break;
            case "50001069":
                errorValue = "Brand and card number do not match.<br/>";
                break;
            case "50001176":
                errorValue = "Card number is too long.<br/>";
                break;
            case "50001177":
                errorValue = "Card number contains non-numeric info.<br/>";
                break;
            case "50001178":
                errorValue = "Card number too short/empty.<br/>";
                break;
        }
    }

    string NC_ERROR_CVC()
    {
        errorValue = string.Empty;
        switch (errorCode)
        {
            case "50001090":
                errorValue = "CVV missing or too short.<br/>";
                break;
            case "50001179":
                errorValue = "CVV too long.<br/>";
                break;
            case "50001180":
                errorValue = "CVV contains non-numeric information.<br/>";
                break;
        }
        return errorValue;
    }

    string NC_ERROR_ED()
    {
        errorValue = string.Empty;
        switch (errorCode)
        {
            case "50001181":
                errorValue = "Expiry date contains non-numeric information.<br/>";
                break;
            case "50001182":
                errorValue = "Invalid expiry month.<br/>";
                break;
            case "50001183":
                errorValue = "Expiry date must be in the future.<br/>";
                break;
            case "31061001":
                errorValue = "Expiry date empty or wrong format.<br/>";
                break;
        }
        return errorValue;
    }

}