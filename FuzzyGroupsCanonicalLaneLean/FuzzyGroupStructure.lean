import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySets

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyGroup (G : Type u) [Group G] where
  fuzzySet : FuzzySet G
  productTnorm : ℝ → ℝ → ℝ
  productTnormContinuous : Prop
  fuzzyProduct : G → G → ℝ
  fuzzyProductDefined : ∀ x y : G, fuzzyProduct x y = productTnorm (fuzzySet.membership x) (fuzzySet.membership y)
  identityMembership : fuzzySet.membership (1 : G) = 1
  inverseMembership : ∀ x : G, fuzzySet.membership x⁻¹ = fuzzySet.membership x
  maxProductBounded : ∀ x y : G, fuzzySet.membership (x * y) ≥ fuzzyProduct x y

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse