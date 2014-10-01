using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using eRestaurant.Entities;
using eRestaurant.DAL;


namespace eRestaurant.BLL
{
    [DataObject]
     public class MenuController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Item> ListMenuItems()
        {
        using (var context = new RestaurantContext())

        {//Note we use lembda for SLecet.Method
            // Get the Item data and include the category data for each item 
            // The .include() method on the DbSet() Class performes " eager loading " of data.

        return context.Items.Include(it => it.Category).ToList();

        }

        }
    }
}
