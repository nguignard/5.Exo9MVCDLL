using Exo9;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ClassesDAO
{
    public static class MSectionDAOEFStatic
    {
        public static MSection RestitueSection(int unCodeSection)
        { // instancier le dbContext au besoin 
            if (DonneesDAO.DbContextFormation == null)
                DonneesDAO.DbContextFormation = new FormationContainer();

            MSection laSection;
            Sections leStage = DonneesDAO.DbContextFormation.SectionsSet.Find(unCodeSection);

            laSection = new MSection(leStage.IdSection, leStage.NomSection/*, leStage.DateDebut, leStage.DateFin*/);
            return laSection;
        }

    }
}
