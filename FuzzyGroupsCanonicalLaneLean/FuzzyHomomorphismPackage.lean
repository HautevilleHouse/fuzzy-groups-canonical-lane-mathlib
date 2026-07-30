import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyHomomorphismPackage (F G : FuzzySubgroupPackage) where
  source : F
  target : G
  map : F.carrier → G.carrier
  membershipPreservation : Prop
  operationPreservation : Prop

structure FuzzyHomomorphismEvidence {F G : FuzzySubgroupPackage} (H : FuzzyHomomorphismPackage F G) where
  membershipPreservationClosed : H.membershipPreservation
  operationPreservationClosed : H.operationPreservation

def FuzzyHomomorphismClosed {F G : FuzzySubgroupPackage} (H : FuzzyHomomorphismPackage F G) : Prop :=
  H.membershipPreservation ∧ H.operationPreservation

theorem fuzzy_homomorphism_closed_from_evidence
    {F G : FuzzySubgroupPackage} (H : FuzzyHomomorphismPackage F G)
    (E : FuzzyHomomorphismEvidence H) : FuzzyHomomorphismClosed H := by
  exact And.intro E.membershipPreservationClosed E.operationPreservationClosed

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean