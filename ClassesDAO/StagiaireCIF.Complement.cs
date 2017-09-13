using Exo9;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesDAO
{
    public partial class StagiaireCIF
    {

        public StagiaireCIF()
        {
        }

        public StagiaireCIF(int unNumOsia, String unNom, String unPrenom, String uneRue, String uneVille, String unCodePostal, 
            int? unNbreNotes, Decimal? unPointsNotes,
            Sections unStage, String unFongecif, String unTypeCIF) :
            base(unNumOsia, unNom, unPrenom, uneRue, uneVille, unCodePostal, unNbreNotes, unPointsNotes, unStage)
        { this.Fongecif = unFongecif; this.TypeCIF = unTypeCIF; }



        public StagiaireCIF(MStagiaire unStagiaire, Sections unStage, String unFongecif, String unTypeCIF):base( unStagiaire,  unStage)
        {



        }
    }
}
