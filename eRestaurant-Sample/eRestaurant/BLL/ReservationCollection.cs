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

        public List<ReservationSummary> Reservations { get; set; }
    }
}

