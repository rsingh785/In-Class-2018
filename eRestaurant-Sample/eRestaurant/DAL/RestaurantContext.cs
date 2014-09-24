using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Threading.Tasks;
using eRestaurant.Entities;
using eRestaurant.BLL;

namespace eRestaurant.DAL
{
    public class RestaurantContext :DbContext
    {
        // Constructor that calls a base- class constructor to specify the 
        // Connnection string we neeed to use.
        public RestaurantContext() : base("name= EatIn") { }

        public DbSet<Table> Tables { get; set;}
        public DbSet<SpecialEvent> SpecialEvents { get; set; }
        public DbSet<Reservation> Reservations { get; set; } 
        public DbSet<Waiter> Waiters { get; set;}
        public DbSet<Bill> Bills { get; set;}
        public DbSet<Item>Items { get; set;}
        public DbSet<MenuCategory> MenuCategories { get; set;}
        public DbSet<BillItem> BillItems { get; set; }


        # region Over - ride OnModelCreating
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder
              .Entity<Reservation>().HasMany(r => r.Tables)
              .WithMany(t => t.Reservations)
              .Map(mapping =>
              {
                  mapping.ToTable("Reservations");
                  mapping.MapLeftKey("Reservations");

                  mapping.MapRightKey("TableID");
              });
            base.OnModelCreating(modelBuilder);
        }
        #endregion 


    
    }
    }

