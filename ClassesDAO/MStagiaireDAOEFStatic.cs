using ClassesDAO;
using Exo9;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesDAO
{

    /// <summary> /// classe accès aux données - BDD : Formations, table : Stagiaires /// </summary>
    public static class MStagiaireDAOEFStatic
    {
        /// <summary> /// instancie les objets MStagiaires spécialisés correspondants aux Entities du dbSet 
        ///  </summary> 
        ///<param name="laSection">la ref de la section qui gère la collection de ces stagiaires</param> 
        public static void InstancieStagiairesSection(MSection laSection)
        {
            // instancier le dbContext au besoin 
            if (DonneesDAO.DbContextFormation == null) DonneesDAO.DbContextFormation = new FormationContainer();

            // requête Linq pour lire la BDD (génère les requ. SQL) 
            var query = from a in DonneesDAO.DbContextFormation.StagiairesSet where a.Sections.IdSection == laSection.IdSection select a;

            // ref d'objet générique (pour la collection)
            MStagiaire leStagiaire;

            // parcourt les lignes de la requête
            foreach (Stagiaires item in query)
            {
                // instancie et renseigne l'objet MStagiaire spécialisé

                if (item is StagiaireCIF)
                {
                    // cas d'un CIF : objet MStagiaireCIF

                    leStagiaire = new MStagiaireCIF(item.NumOsia, item.NomStagiaire, item.PrenomStagiaire, item.rueStagiaire, item.VilleStagiaire,
                        item.CodePostalStagiaire, ((StagiaireCIF)item).Fongecif, ((StagiaireCIF)item).TypeCIF.Trim());
                }
                else
                {
                    // cas d'un DE : objet MStagiaireDE 
                    leStagiaire = new MStagiaireDE(item.NumOsia, item.NomStagiaire.Trim(), item.PrenomStagiaire, item.rueStagiaire, item.VilleStagiaire,
                        item.CodePostalStagiaire.Trim(), ((StagiaireDE)item).RemuAfpa);
                }

                // affecter points et notes
                // on ne peut affecter directement pointsnotes et nbreNotes 
                // dans MStagiaire que si le demandeur est de ce type MStagiaireDAOEFStatic 
                leStagiaire.SetPoints(Convert.ToDouble(item.PointsNotes), (int)item.NbreNote, typeof(MStagiaireDAOEFStatic).ToString());

                // ajoute le Stagiaire à la collection de la section 
                laSection.Ajouter(leStagiaire);
            }
        }




    }
}
