import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

def ConstrainedFuzzyGroupClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_group_endgame (A : AdmissibleClass) :
    ConstrainedFuzzyGroupClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse