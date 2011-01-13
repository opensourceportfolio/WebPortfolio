using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Holding
    {
        public virtual string holdingID { get; set; }
        public virtual string symbol { get; set; }
        public virtual Portfolio Portfolio { get; set; }
        public virtual IList<Dividend> dividends { get; set; }
        public virtual IList<Purchase> purchases { get; set; }

        public Holding()
        {
            dividends = new List<Dividend>();
            purchases = new List<Purchase>();
        }
    }
}
