import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyGroup (G : Type u) [Group G] where
  membershipFunction : G → ℝ
  membershipRange : membershipFunction '' Set.univ ⊆ Set.Icc (0 : ℝ) 1
  membershipOfIdentity : membershipFunction 1 = 1
  membershipOfInverse (g : G) : membershipFunction g = membershipFunction (g⁻¹)
  membershipOfProduct (g h : G) : membershipFunction (g * h) ≥ min (membershipFunction g) (membershipFunction h)
  productClosed : Prop

structure FuzzyGroupAdmissibleObject (G : Type u) [Group G] where
  fuzzyGroup : FuzzyGroup G
  conclusion : fuzzyGroup.productClosed

structure AdmissibleClass where
  object : FuzzyGroupAdmissibleObject (Z : Type u) [Group Z]
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def fuzzyGroupWitnessClosed (O : FuzzyGroupAdmissibleObject G) : Prop :=
  O.conclusion

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse