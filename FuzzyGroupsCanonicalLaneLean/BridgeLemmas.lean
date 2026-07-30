import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∀ g : ℤ, A.object.fgroup.carrier.membership g ≤ 1

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  intro g
  apply A.object.fgroup.carrier.membership g

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse