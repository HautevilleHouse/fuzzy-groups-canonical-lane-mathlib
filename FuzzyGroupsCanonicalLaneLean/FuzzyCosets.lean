import canonicalLaneMathlib.AdmissibleClass
import FuzzyGroupsCanonicalLaneLean.FuzzySubgroups

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyCoset {G : Type u} [Group G] (H : FuzzySubgroup G) (a : G) where
  left_coset_membership : G → ℝ
  membership_shift : ∀ x : G, left_coset_membership x = H.carrier (a⁻¹ * x)

def FuzzyCosetClosed {G : Type u} [Group G] {H : FuzzySubgroup G} (a : G)
    (C : FuzzyCoset H a) : Prop :=
  ∀ x : G, C.left_coset_membership x = H.carrier (a⁻¹ * x)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
