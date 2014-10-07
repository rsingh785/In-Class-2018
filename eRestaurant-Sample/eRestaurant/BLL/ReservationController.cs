using eRestaurant.DAL;
using eRestaurant.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.BLL
{
    [DataObject]
    public class ReservationController
    {
         [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<SpecialEvent> ListAllReservations()
        {
            using(RestaurantContext context = new RestaurantContext())
            {
                return context.SpecialEvents.ToList();
            }
        }
       
        public List<Reservation> LookupReservationsBySpecialEvent(string EventCode)
        {
            using (RestaurantContext context = new RestaurantContext())
            {
                var result = from data in context.Reservations
                           where data.EventCode == EventCode
                           select data;
                return result.ToList();
            }

        }
    }
}
