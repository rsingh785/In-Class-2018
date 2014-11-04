using eRestaurant.Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.BLL
{
    public class ReservationCollection
    {
        public int Time { get; set; }
        public TimeSpan SeatingTime { get { return new TimeSpan(Time, 0, 0); } }
        public List<ReservationSummary> Reservations { get; set; }
    }
}

