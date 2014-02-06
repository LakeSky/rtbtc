using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using meis007Model;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Bookings_VoucherPrint : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["meis007ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Session["BkgID"] ;
            RepeterData();
            FillData();
        }
    }

    public void FillData()
    {
        try
        {
            con.Open();
            cmd = new SqlCommand("spsearch @TableName='ProductMaster,BkgMaster,CityMaster',@ColumnsTxt='ProductMaster.*,BkgMaster.*,CityName',@SearchTxt='BkgMaster.ProductID = ProductMaster.ProductID and ProductMaster.CityID = CityMaster.CityId and bkgStatus=''CC'' and Bkgid=" + Session["BkgId"].ToString() + "',@SortColumn='Bkgid'", con);
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                this.lblBBName.Text = dr["BBName"].ToString();
                this.lblBkgDate.Text = Convert.ToDateTime(dr["BkgDate"]).ToString("dd-MMM-yyyy");
                this.lblBkgId.Text = dr["BkgId"].ToString();
                this.lblCheckIN.Text = Convert.ToDateTime(dr["CheckIN"]).ToString("dd-MMM-yyyy");
                this.lblCheckOUT.Text = Convert.ToDateTime(dr["CheckOUT"]).ToString("dd-MMM-yyyy");
                this.lblCity.Text = dr["CityName"].ToString();
                this.lblCustomerRemarks.Text = dr["CustomerRemarks"].ToString();
                this.lblHotelAddress.Text = dr["Address"].ToString();
                this.lblProductName.Text = dr["ProductName"].ToString();
                this.lblRoomName.Text = dr["SupplierRoomName"].ToString();
                this.lblRoomType.Text = dr["SupplierRoomType"].ToString();
                this.lblServiceName.Text = (dr["ServiceName"].ToString() == "HOTELS") ? "Hotel : " : dr["ServiceName"].ToString();
                this.lblSupConNo.Text = dr["SupplierConfNo"].ToString();
                this.lblSupplierRemarks.Text = dr["SupplierRemarks"].ToString();
                this.lblSupRefNo.Text = dr["SupplierRefNo"].ToString();
                this.lblTel.Text = dr["Tel"].ToString();
                this.lblTotalNights.Text = dr["NoOfNights"].ToString();
                this.lblNoOfAdults.Text = dr["Adults"].ToString();
                this.lblNoOfChild.Text = dr["Children"].ToString();
                this.lblNoOfInfant.Text = dr["Infants"].ToString();

            }
        }
        catch
        {
        }
    }
    public void RepeterData()
    {
        con.Open();
        cmd = new SqlCommand("Select * from Paxdetails where bkgid = " + Session["BkgId"].ToString() + " Order By sno", con);
        DataSet ds = new DataSet();
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        repGuests.DataSource = ds;
        repGuests.DataBind();
        da.Dispose();
        cmd.Dispose();
        con.Close();
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = pnl1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=700px,scrollbars=1');</script>");
    }
}