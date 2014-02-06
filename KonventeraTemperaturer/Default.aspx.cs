using KonventeraTemperaturer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KonventeraTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MyButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            { 
                //Runda ringen innan C eller F i headerRow.
                char degree = (char)176;

                var startNumber = int.Parse(Start.Text);            
                var lastNumber = int.Parse(Slut.Text);
                var stepNumber = int.Parse(Steg.Text);
                              
                for (var i = startNumber; i <= lastNumber; i += stepNumber)
                {
                    //Skapar och lägger till en rad
                    TableRow TRow = new TableRow();                    
                    
                    //Skapar och lägger till cell
                    TableCell myTableCell1 = new TableCell();
                    myTableCell1.Text = i.ToString();
                    TRow.Cells.Add(myTableCell1);

                    //Skapar och lägger till andra cell
                    TableCell myTableCell2 = new TableCell();

                    if (RadioButton1.Checked) //koden för celsius till fahernheit
                    {
                        myTableCell2.Text = KonventeraTemperaturer.Model.TemperatureConverter.CelsiusToFahrenheit(i).ToString();
                    }
                    if (RadioButton2.Checked) //Koden för Farhenheit till celsius
                    {
                        myTableCell2.Text = KonventeraTemperaturer.Model.TemperatureConverter.FahrenheitToCelsius(i).ToString();
                    }                      

                    TRow.Cells.Add(myTableCell2);
                    MyTable.Rows.Add(TRow);                    
                }               
 
                //Header Row
                TableHeaderRow HeaderRow = new TableHeaderRow();

                TableHeaderCell headerTableCell1 = new TableHeaderCell();
                TableHeaderCell headerTableCell2 = new TableHeaderCell();                

                headerTableCell1.Text = string.Format("{0}C", degree);
                headerTableCell1.Scope = TableHeaderScope.Column;
                headerTableCell1.AbbreviatedText = "Col 1 Head";

                headerTableCell2.Text = string.Format("{0}F", degree);
                headerTableCell2.Scope = TableHeaderScope.Column;
                headerTableCell2.AbbreviatedText = "Col 2 Head";
                
                if (RadioButton1.Checked) //koden för celsius till fahernheit
                {
                    HeaderRow.Cells.Add(headerTableCell1); //fösta C
                    HeaderRow.Cells.Add(headerTableCell2); //andra F
                }
                if (RadioButton2.Checked) //Koden för Farhenheit till celsius
                {
                    HeaderRow.Cells.Add(headerTableCell2); //fösta F
                    HeaderRow.Cells.Add(headerTableCell1); //andra C
                }  
                MyTable.Rows.AddAt(0, HeaderRow);

                MyTable.Visible = true;
            }             
        }
    }
}