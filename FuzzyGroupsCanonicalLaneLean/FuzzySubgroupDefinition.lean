import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyGroupDefinition

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroup (G : FuzzyGroup) where
  subcarrier : Set G.carrier
  membershipRestricted : G.carrier → ℝ
  membershipCompatible : ∀ x : G.carrier, membershipRestricted x ≤ G.membership x
  closure : ∀ x y : G.carrier, x ∈ subcarrier → y ∈ subcarrier → operation G x y ∈ subcarrier
  identityMembership : identity G ∈ subcarrier
  inversesMembership : ∀ x : G.carrier, x ∈ subcarrier → inverses G x ∈ subcarrier
  membershipRespected : ∀ x : G.carrier, membershipRestricted x = if x ∈ subcarrier then G.membership x else 0

theorem fuzzy_subgroup_membership_nonneg (G : FuzzyGroup) (H : FuzzySubgroup G) (x : G.carrier) : 0 ≤ H.membershipRestricted x :=
  by
    rw [H.membershipRespected x]
    split
    · exact (fuzzy_group_membership_nonneg G x)
    · linarith

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse