using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Transaction
    {

        public string type { get; set; }
        public string transactionDate { get; set; }
        public double price { get; set; }
        public double shares { get; set; }
        public double commission { get; set; }
        public string currency { get; set; }
        public double transactionValue { get; set; }

    }
}
