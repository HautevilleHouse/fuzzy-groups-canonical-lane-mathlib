import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyNormalSubgroupPackage {G : Type u} [Group G] (F : FuzzySubgroupLevelCutPackage G) where
  normalityCondition : ∀ g h : G, (g * h ∈ F.cutSet) → (h * g ∈ F.cutSet)

structure FuzzyNormalSubgroupEvidence {G : Type u} [Group G] {F : FuzzySubgroupLevelCutPackage G}
  (N : FuzzyNormalSubgroupPackage F) where
  normalityConditionClosed : N.normalityCondition

def FuzzyNormalSubgroupClosed {G : Type u} [Group G] {F : FuzzySubgroupLevelCutPackage G}
  (N : FuzzyNormalSubgroupPackage F) : Prop :=
  N.normalityCondition

theorem fuzzy_normal_subgroup_closed_from_evidence
  {G : Type u} [Group G] {F : FuzzySubgroupLevelCutPackage G}
  (N : FuzzyNormalSubgroupPackage F) (E : FuzzyNormalSubgroupEvidence N) :
  FuzzyNormalSubgroupClosed N := by
  exact E.normalityConditionClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse