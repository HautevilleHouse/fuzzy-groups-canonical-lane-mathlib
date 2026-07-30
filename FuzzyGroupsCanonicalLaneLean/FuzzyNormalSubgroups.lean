import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyHomomorphisms

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyNormalSubgroup (G : Type u) [Group G] (F : FuzzySubgroup G) where
  normalCondition : ∀ g h : G, F.membershipFunction (g * h * g⁻¹) = F.membershipFunction h

structure FuzzyNormalSubgroupEvidence (G : Type u) [Group G] (F : FuzzySubgroup G) (N : FuzzyNormalSubgroup G F) where
  normalConditionClosed : ∀ g h : G, F.membershipFunction (g * h * g⁻¹) = F.membershipFunction h

def FuzzyNormalSubgroupClosed (G : Type u) [Group G] (F : FuzzySubgroup G) (N : FuzzyNormalSubgroup G F) : Prop :=
  ∀ g h : G, F.membershipFunction (g * h * g⁻¹) = F.membershipFunction h

theorem fuzzy_normal_subgroup_closed_from_evidence (G : Type u) [Group G] (F : FuzzySubgroup G) (N : FuzzyNormalSubgroup G F) (E : FuzzyNormalSubgroupEvidence G F N) : FuzzyNormalSubgroupClosed G F N := by
  exact E.normalConditionClosed

structure FuzzyQuotientGroup (G : Type u) [Group G] (F : FuzzySubgroup G) (N : FuzzyNormalSubgroup G F) where
  quotientGroup : Type u
  quotientGroupGroup : Group quotientGroup
  canonicalMap : G → quotientGroup
  membershipOnCosets : (quotientGroup → ℝ) → Prop

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
