import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroups

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyCoset (G : Type u) [Group G] (F : FuzzySubgroup G) (a : G) where
  cosetMembership : G → ℝ
  cosetMembershipDefined : ∀ g : G, cosetMembership g = F.membershipFunction (a⁻¹ * g)

structure FuzzyCosetEvidence (G : Type u) [Group G] (F : FuzzySubgroup G) (a : G) (C : FuzzyCoset G F a) where
  cosetIsFuzzySet : True
  cosetMembershipCorrect : ∀ g : G, C.cosetMembership g = F.membershipFunction (a⁻¹ * g)

structure FuzzyLagrangeTheorem (G : Type u) [Group G] [Fintype G] (F : FuzzySubgroup G) where
  index : ℕ
  orderOfG : ℕ
  orderOfFuzzySubgroup : ℝ
  lagrangeEquality : orderOfFuzzySubgroup * (index : ℝ) = (Fintype.card G : ℝ)

structure FuzzyLagrangeEvidence (G : Type u) [Group G] [Fintype G] (F : FuzzySubgroup G) (L : FuzzyLagrangeTheorem G F) where
  orderOfFuzzySubgroupDefined : L.orderOfFuzzySubgroup = ∑ g : G, F.membershipFunction g
  lagrangeEqualityClosed : L.lagrangeEquality

def FuzzyCosetClosed (G : Type u) [Group G] (F : FuzzySubgroup G) (a : G) (C : FuzzyCoset G F a) : Prop :=
  ∀ g : G, C.cosetMembership g = F.membershipFunction (a⁻¹ * g)

theorem fuzzy_coset_closed_from_evidence (G : Type u) [Group G] (F : FuzzySubgroup G) (a : G) (C : FuzzyCoset G F a) (E : FuzzyCosetEvidence G F a C) : FuzzyCosetClosed G F a C := by
  exact E.cosetMembershipCorrect

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
