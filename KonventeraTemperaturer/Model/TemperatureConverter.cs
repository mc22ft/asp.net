using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonventeraTemperaturer.Model
{
    public static class TemperatureConverter
    {
        public static int CelsiusToFahrenheit(int value)
        {
            double fahrenheit;
            int BackFahrenheitInt;

            //Runda av till närmasta heltal
            fahrenheit = Math.Round((value * 1.8) + 32);

            //Konverterat till int
            BackFahrenheitInt = Convert.ToInt32(fahrenheit);

            return BackFahrenheitInt;
        }

        public static int FahrenheitToCelsius(int value)
        {
            double celsius;
            double roundedCelsius;
            int backCelsiusInt;            
            
            //Uträkning            
            celsius = (5.0 / 9.0) * (value - 32);

            //Rundar av till närmsta heltal
            roundedCelsius = Math.Round(celsius);

            //Konverterat till int
            backCelsiusInt = Convert.ToInt32(roundedCelsius);

            return backCelsiusInt;
        }

    }
}