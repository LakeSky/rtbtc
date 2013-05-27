using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using meis007Model;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        meis007Entities en = new meis007Entities();
        //GridView1.DataSource = en.CommChannels.ToList();
        //GridView1.DataBind();
    }
}
