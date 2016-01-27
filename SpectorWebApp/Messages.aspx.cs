using Spector.BusinessService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpectorWebApp
{
    public partial class Messages : System.Web.UI.Page
    {
        private SpectorWCF client = new SpectorWCF();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var Messages = client.GetAllMessages();

                if (Messages.Count() == 0)
                    client.AddMessage("First Message"); // just to seed data to show for first run!

                MsgsGrid.DataSource = client.GetAllMessages();
                MsgsGrid.DataBind();
            }
        }

    }
}