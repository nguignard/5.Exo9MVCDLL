using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesDAO
{
    public partial class StagiaireDE:Stagiaires
    {

        public StagiaireDE()
        {
        }

        public StagiaireDE(Int32 unNumosia, String unNom, String unPrenom, String uneRue, String uneVille, String UnCodePostal,
          int? note, Decimal? unPointsNotes, Sections unStage, Boolean unRemuAfpa):base()
        {
            this.RemuAfpa = unRemuAfpa;
        }

       
    }
}
