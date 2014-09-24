using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Entities
{
    public class BillItem

    {
        [Key]
        [Column(Order = 1)]
        public int BillID { get; set; }
        [Key]
        [Column(Order = 2)]
        public int ItemID { get; set; }


    [Required(ErrorMessage =" Quantity is required" )]
    [Range(1,20 , ErrorMessage = "Quantity must be between 1 and 20 ")]
        public int Quantity { get; set; }
    [Required(ErrorMessage = " SalePrice is required")]
    [Range(0.00, 50, ErrorMessage = "Sale Price must be between zero and $50.00 imclusive")]

    public decimal SalePrice { get; set;  }
         [Required(ErrorMessage =" Unit Cost  is required" )]
    [Range(0.01, 30 , ErrorMessage = "Unit Cost  must be between 0.01 and 30 ")]


          public decimal UnitCost { get; set;  }
         public string Notes { get; set;  }


         public virtual Bill Bill { get; set; }
         public virtual Item Item { get; set; }

    }
       
    
}
