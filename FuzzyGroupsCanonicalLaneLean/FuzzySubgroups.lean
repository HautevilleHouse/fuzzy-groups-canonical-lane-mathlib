import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroup (G : Type u) [Group G] where
  membershipFunction : G → ℝ
  membershipInUnitInterval : ∀ g : G, 0 ≤ membershipFunction g ∧ membershipFunction g ≤ 1
  containsIdentity : membershipFunction 1 = 1
  closedUnderInverse : ∀ g : G, membershipFunction (g⁻¹) = membershipFunction g
  closedUnderMultiplication : ∀ g h : G, membershipFunction (g * h) ≥ min (membershipFunction g) (membershipFunction h)

structure FuzzySubgroupEvidence (G : Type u) [Group G] (F : FuzzySubgroup G) where
  membershipInUnitIntervalClosed : ∀ g : G, 0 ≤ F.membershipFunction g ∧ F.membershipFunction g ≤ 1
  containsIdentityClosed : F.membershipFunction 1 = 1
  closedUnderInverseClosed : ∀ g : G, F.membershipFunction (g⁻¹) = F.membershipFunction g
  closedUnderMultiplicationClosed : ∀ g h : G, F.membershipFunction (g * h) ≥ min (F.membershipFunction g) (F.membershipFunction h)

def FuzzySubgroupClosed (G : Type u) [Group G] (F : FuzzySubgroup G) : Prop :=
  (∀ g : G, 0 ≤ F.membershipFunction g ∧ F.membershipFunction g ≤ 1) ∧
  F.membershipFunction 1 = 1 ∧
  (∀ g : G, F.membershipFunction (g⁻¹) = F.membershipFunction g) ∧
  (∀ g h : G, F.membershipFunction (g * h) ≥ min (F.membershipFunction g) (F.membershipFunction h))

theorem fuzzy_subgroup_closed_from_evidence (G : Type u) [Group G] (F : FuzzySubgroup G) (E : FuzzySubgroupEvidence G F) : FuzzySubgroupClosed G F := by
  exact And.intro E.membershipInUnitIntervalClosed
    (And.intro E.containsIdentityClosed
      (And.intro E.closedUnderInverseClosed E.closedUnderMultiplicationClosed))

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
