import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySetMembership (X : Type u) where
  carrier : X → ℝ
  membershipRange : ∀ x : X, 0 ≤ carrier x ∧ carrier x ≤ 1

structure FuzzySubgroupMembership {G : Type u} [Group G] (F : FuzzySetMembership G) where
  fuzzyIdentity : F.carrier 1 = 1
  fuzzyInverse : ∀ g : G, F.carrier g⁻¹ = F.carrier g
  fuzzyProduct : ∀ g h : G, F.carrier (g * h) ≥ min (F.carrier g) (F.carrier h)

def FuzzyMembershipClosed {G : Type u} [Group G] (F : FuzzySetMembership G) : Prop :=
  ∃ (S : FuzzySubgroupMembership F), True

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse