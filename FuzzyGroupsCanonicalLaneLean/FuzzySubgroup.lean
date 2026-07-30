import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroupPackage {G : Type} [Group G] (FG : FuzzyGroup G) where
  carrier : G → ℝ
  carrier_subset : ∀ x : G, carrier x ≤ FG.carrier.membership x
  product_membership_sub : ∀ x y : G, carrier (G * x * y) ≥ min (carrier x) (carrier y)
  inverse_membership_sub : ∀ x : G, carrier (G.inv x) = carrier x
  identity_membership_sub : carrier (G.one : G) = 1

structure FuzzySubgroupEvidence {G : Type} [Group G] {FG : FuzzyGroup G} (S : FuzzySubgroupPackage FG) where
  carrier_subset_closed : S.carrier_subset
  product_membership_sub_closed : S.product_membership_sub
  inverse_membership_sub_closed : S.inverse_membership_sub
  identity_membership_sub_closed : S.identity_membership_sub

def FuzzySubgroupClosed {G : Type} [Group G] {FG : FuzzyGroup G} (S : FuzzySubgroupPackage FG) : Prop :=
  S.carrier_subset ∧ S.product_membership_sub ∧ S.inverse_membership_sub ∧ S.identity_membership_sub

theorem fuzzy_subgroup_closed_from_evidence
    {G : Type} [Group G] {FG : FuzzyGroup G} (S : FuzzySubgroupPackage FG)
    (E : FuzzySubgroupEvidence S) : FuzzySubgroupClosed S := by
  exact And.intro E.carrier_subset_closed
    (And.intro E.product_membership_sub_closed
      (And.intro E.inverse_membership_sub_closed E.identity_membership_sub_closed))

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse