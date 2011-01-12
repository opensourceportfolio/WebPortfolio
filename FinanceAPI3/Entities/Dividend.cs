using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Dividend
    {

        public string dividendDate { get; set; }
        public string type { get; set; }
        public double tax { get; set; }
        public double amount { get; set; }
        public string currency { get; set; }
        public string note { get; set; }

        public Dividend()
        {
        }

        public Dividend(string dividendValue, string dividendDate)
        {
            this.dividendValue = double.Parse(dividendValue);
            dividendDate = System.DateTime.Parse(this.dividendDate).ToShortDateString();
        }

        public double dividendValue
        {
            get { return amount - tax; }
            set
            {
                amount = value;
                tax = 0;
            }
        }
    }
}