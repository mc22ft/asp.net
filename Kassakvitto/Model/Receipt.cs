using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kassakvitto.Model
{
    public class Receipt
    {
        //Fält
        private double _subtotal; 

        //Constructor
        public Receipt()//(double subtotal)
        {
            //Subtotal = subtotal;  
        }

        //Properties
        public double Subtotal
        {
            get
            {
                return _subtotal; 
            }
            set
            {
                _subtotal = value; //kontrollera att värdet inte är mindre än 0

                if (_subtotal <= 0)
                {
                    throw new ArgumentOutOfRangeException("Du kan inte mata in ett tal som är 0 eller mindre!");
                }
                 
            }
        }

        public double DiscountRate
        {
            get; 
            private set;
        }

        public double MoneyOff
        {
            get;
            private set;
        }        

        public double Total
        {
            get;
            private set;
        }

        //Methods
        public void Calculate(double subtotal)
        {
            Subtotal = subtotal;

            if (subtotal >= 0 && subtotal <= 499) // 0%
            {
                DiscountRate = 0;
                Total = subtotal;
                MoneyOff = subtotal - Total;
            }
            else if (subtotal >= 500 && subtotal <= 999) // 5%
            {
                DiscountRate = 5;
                Total = subtotal - (subtotal * 0.05);
                MoneyOff = subtotal - Total;
            }
            else if (subtotal >= 1000 && subtotal <= 4999) // 10%
            {
                DiscountRate = 10;
                Total = subtotal - (subtotal * 0.1);
                MoneyOff = subtotal - Total;
            }
            else //Över 4999. 15%
            {
                DiscountRate = 15;
                Total = subtotal - (subtotal * 0.15);
                MoneyOff = subtotal - Total;
            } 
        }
    }
}