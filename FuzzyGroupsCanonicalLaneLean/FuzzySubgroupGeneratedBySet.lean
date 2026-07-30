import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupLattice

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroupGeneratedBySet (G : Type u) [Group G] (S : Set G) where
  generatorFuzzySet : G → ℝ
  generatorMembershipInUnitInterval : ∀ g : G, 0 ≤ generatorFuzzySet g ∧ generatorFuzzySet g ≤ 1
  generatedFuzzySubgroup : FuzzySubgroup G
  generationCondition : generatedFuzzySubgroup.membershipFunction = ⨅ (F : FuzzySubgroup G) (_ : ∀ g ∈ S, F.membershipFunction g ≥ generatorFuzzySet g), F.membershipFunction

structure FuzzySubgroupGeneratedBySetEvidence (G : Type u) [Group G] (S : Set G) (F : FuzzySubgroupGeneratedBySet G S) where
  generatedIsFuzzySubgroup : FuzzySubgroup G
  membershipMatches : ∀ g : G, generatedIsFuzzySubgroup.membershipFunction g = ⨅ (H : FuzzySubgroup G) (_ : ∀ x ∈ S, H.membershipFunction x ≥ F.generatorFuzzySet x), H.membershipFunction g

def FuzzySubgroupGeneratedClosed (G : Type u) [Group G] (S : Set G) (F : FuzzySubgroupGeneratedBySet G S) : Prop :=
  ∀ g : G, F.generatedFuzzySubgroup.membershipFunction g = ⨅ (H : FuzzySubgroup G) (_ : ∀ x ∈ S, H.membershipFunction x ≥ F.generatorFuzzySet x), H.membershipFunction g

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
