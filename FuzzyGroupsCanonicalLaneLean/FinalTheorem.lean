import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

def ConstrainedFuzzyGroupsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_groups_endgame (A : AdmissibleClass) : ConstrainedFuzzyGroupsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse