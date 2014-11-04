using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.BLL
{
    [DataObject]
   public class SeatingController
   {
       #region Query Method
       [DataObjectMethod(DataObjectMethodType.Select)]
       public List<SeatingSummary> SeatingByDateTime(DateTime date, TimeSpan time)
        {
            using (var context = new RestaurantContext())
            {


            }
           
        }
    }
}
