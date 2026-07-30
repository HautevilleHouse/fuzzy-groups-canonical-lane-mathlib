import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyGroupDefinition
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupDefinition
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyNormalSubgroup
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyGroupHomomorphism

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyAdmissibleClass where
  object : FuzzyGroup
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def fuzzyBridgeClosed (A : FuzzyAdmissibleClass) : Prop :=
  fuzzy_group_membership_nonneg A.object 1 ∧ fuzzy_group_membership_le_one A.object 1

theorem fuzzy_bridge_from_admissible_class (A : FuzzyAdmissibleClass) : fuzzyBridgeClosed A :=
  by
    exact And.intro (fuzzy_group_membership_nonneg A.object 1) (fuzzy_group_membership_le_one A.object 1)

def fuzzyGateClosed (A : FuzzyAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem fuzzy_gate_from_admissible_class (A : FuzzyAdmissibleClass) : fuzzyGateClosed A :=
  A.gateWitness

def ConstrainedFuzzyGroupClosure (A : FuzzyAdmissibleClass) : Prop :=
  fuzzyBridgeClosed A ∧ fuzzyGateClosed A

theorem constrained_fuzzy_group_endgame (A : FuzzyAdmissibleClass) : ConstrainedFuzzyGroupClosure A :=
  by
    exact And.intro (fuzzy_bridge_from_admissible_class A) (fuzzy_gate_from_admissible_class A)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse