using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesDAO
{
    public partial class Stagiaires
    {

        public Stagiaires()
        {

        }

        public Stagiaires(int unNumOsia, String unNom, String unPrenom, String uneRue, String uneVille, String unCodePostal, int? unNbreNotes, Decimal? unPointsNotes, Sections unStage)
        { this.NumOsia = unNumOsia; this.NomStagiaire = unNom; this.PrenomStagiaire = unPrenom; this.rueStagiaire = uneRue; this.VilleStagiaire = uneVille; this.CodePostalStagiaire = unCodePostal; this.NbreNotes = unNbreNotes; this.PointsNotes = unPointsNotes; this.Sections = unStage; }

		



    }
} 
