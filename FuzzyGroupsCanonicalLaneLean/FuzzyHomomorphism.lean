import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyHomomorphismPackage {G : Type u} [Group G] {H : Type v} [Group H] where
  functionMap : G → H
  membershipPreservation : ∀ (g : G) (t : ℝ), (g ∈ fuzzySet g t) → (functionMap g ∈ fuzzySet (functionMap g) t)
  productPreservation : ∀ g1 g2 : G, functionMap (g1 * g2) = functionMap g1 * functionMap g2

structure FuzzyHomomorphismEvidence {G : Type u} [Group G] {H : Type v} [Group H]
  (F : FuzzyHomomorphismPackage G H) where
  membershipPreservationClosed : F.membershipPreservation
  productPreservationClosed : F.productPreservation

def FuzzyHomomorphismClosed {G : Type u} [Group G] {H : Type v} [Group H]
  (F : FuzzyHomomorphismPackage G H) : Prop :=
  F.membershipPreservation ∧ F.productPreservation

theorem fuzzy_homomorphism_closed_from_evidence
  {G : Type u} [Group G] {H : Type v} [Group H]
  (F : FuzzyHomomorphismPackage G H) (E : FuzzyHomomorphismEvidence F) :
  FuzzyHomomorphismClosed F := by
  exact And.intro E.membershipPreservationClosed E.productPreservationClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse