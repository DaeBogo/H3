//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace H3_DB_ORM
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Treatment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tbl_Treatment()
        {
            this.Tbl_Medication = new HashSet<Tbl_Medication>();
        }
    
        public int Id { get; set; }
        public string Medication { get; set; }
        public string Name { get; set; }
        public int Tbl_SicknessId { get; set; }
    
        public virtual Tbl_Sickness Tbl_Sickness { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Medication> Tbl_Medication { get; set; }
    }
}
