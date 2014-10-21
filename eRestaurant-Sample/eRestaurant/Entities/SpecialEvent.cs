﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Entities
{
    public class SpecialEvent
    {
        [Key]
    [Required(ErrorMessage = "An Event Code is Required (one Character only)")]
        [StringLength(1, ErrorMessage = " Event Codes can only use a single- character code")]
        public string EventCode { get; set; }
        [Required (ErrorMessage = "  A description is required (5-30 characters)")]
        [StringLength(30, MinimumLength = 5, ErrorMessage = " Description must be from 5-30 characters")]
        public string Description { get; set; }
        public bool Active { get; set; }
        
        #region Navigation Properties
        public virtual ICollection<Reservation> Reservations { get; set; }

        #endregion
    }
}
