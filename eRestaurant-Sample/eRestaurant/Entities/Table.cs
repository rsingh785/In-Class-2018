using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Entities
{
   public class Table
    {
       
       // by conversations, if we use a property with the same name as the class but with a suffic of ID 
       // then Entity Framework will reconganise that property as snapping to the database table's primary Key column.
       public int TableID { get; set; }
       public byte Tablenumber { get; set; }
       public bool Smoking { get; set; }
       public int Capacity{get; set;}
       public bool Available{get; set;}

       public virtual ICollection<Reservation> Reservations { get; set; }

   }
}
