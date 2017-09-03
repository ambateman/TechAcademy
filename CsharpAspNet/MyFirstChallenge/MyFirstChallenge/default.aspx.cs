using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyFirstChallenge
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFortune_Click(object sender, EventArgs e)
        {
            string age = txtAge.Text;
            string money = txtCash.Text;
            string fortune = "At " + age + " years old, I would have expected you to have more than " + money + " in your pocket.";
            lblSarcasm.Text = fortune;
        }

        protected void txtCash_TextChanged(object sender, EventArgs e)
        {

        }
    }
}