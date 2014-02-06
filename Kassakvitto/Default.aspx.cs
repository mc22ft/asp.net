using Kassakvitto.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kassakvitto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {           
            if (IsValid)
            {
                try
                {
                    var sum = Total.Text;

                    var myReceipe = new Receipt();
                    myReceipe.Calculate(Double.Parse(sum));

                    subtotal.Text = string.Format(subtotal.Text, myReceipe.Subtotal);
                    discountrate.Text = string.Format(discountrate.Text, myReceipe.DiscountRate);
                    moneyoff.Text = string.Format(moneyoff.Text, myReceipe.MoneyOff);
                    totalamount.Text = string.Format(totalamount.Text, myReceipe.Total);

                    OutPutPlaceHolder.Visible = true;
                }
                catch (Exception)
                {
                    //Länk till felsida
                    Response.Redirect("Error.html");
                }
            }
        }
    }
}
// Första tanken var att göra på detta sätt. Men lättare att formatera på det sätt jag använt mig av.
//test.Text = string.Format("Total: {0:c}" + "<br>" + "Rabattsats: {1:p0}" + "<br>" + "Rabatt: {2:c}" + "<br>" + "Att betala: {3:c}", 
//    myReceipe.Subtotal, myReceipe.DiscountRate, myReceipe.MoneyOff, myReceipe.Total );