import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyGroupStructure

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure NormalFuzzySubgroup (G : Type u) [Group G] (F : FuzzyGroup G) where
  isNormal : Prop
  conjugateMembershipEqual : ∀ x y : G, F.fuzzySet.membership (x * y * x⁻¹) = F.fuzzySet.membership y

structure FuzzyQuotientGroup (G : Type u) [Group G] (F : FuzzyGroup G) (N : NormalFuzzySubgroup G F) where
  quotientCarrier : Type u
  quotientGroup : Group quotientCarrier
  canonicalProjection : G → quotientCarrier

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse