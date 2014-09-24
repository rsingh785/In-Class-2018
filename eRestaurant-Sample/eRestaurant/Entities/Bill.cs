using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Entities
{
    public class Bill
    {


        public int BillID { get; set; }
        public DateTime BillDate { get; set; }
        public DateTime OrderPlaced { get; set; }
        public int NumberInParty { get; set; }
        public bool PaidStatus{ get; set; }
        public int WaiterID { get; set; }
        public int TableID { get; set; }
        public int ReservationID { get; set; }

        public virtual ICollection<BillItem> BillItem { get; set; }
    }
}
