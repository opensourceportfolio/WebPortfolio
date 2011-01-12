using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class ExchangeRate
    {
        private const string exchangeRateURL = "http://www.exchangerate-api.com/USD/CAD?k=GtKMM-3F4HE-UGxxU";
        private double _exchangeRate = 0;

        public double getExchangeRate
        {
            get
            {
                if (_exchangeRate == 0)
                {
                    _exchangeRate = loadExchangeRate();
                }
                return _exchangeRate;
            }
        }

        private double loadExchangeRate()
        {
            var data = downloadData(exchangeRateURL);
            if (data == null)
                data = "1";
            return double.Parse(data);
        }

        private string downloadData(string url)
        {
            try
            {
                System.Net.WebClient webClient = new System.Net.WebClient();
                string data = null;
                data = webClient.DownloadString(url);
                return data;
            }
            catch
            {
                return "";
            }
        }
    }
}
