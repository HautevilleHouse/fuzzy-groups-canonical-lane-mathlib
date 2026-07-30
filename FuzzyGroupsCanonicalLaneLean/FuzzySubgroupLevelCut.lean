import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroupLevelCutPackage {G : Type u} [Group G] where
  level : ℝ
  cutSet : Set G
  subsetClosed : cutSet ⊆ Set.univ
  identityCondition : (1 : G) ∈ cutSet
  inversionCondition : ∀ g ∈ cutSet, g⁻¹ ∈ cutSet
  productCondition : ∀ g h ∈ cutSet, g * h ∈ cutSet

structure FuzzySubgroupLevelCutEvidence {G : Type u} [Group G]
  (F : FuzzySubgroupLevelCutPackage G) where
  levelClosed : F.level ∈ Set.Ioo (0 : ℝ) 1
  subsetClosedClosed : F.subsetClosed
  identityConditionClosed : F.identityCondition
  inversionConditionClosed : F.inversionCondition
  productConditionClosed : F.productCondition

def FuzzySubgroupLevelCutClosed {G : Type u} [Group G]
  (F : FuzzySubgroupLevelCutPackage G) : Prop :=
  F.level ∈ Set.Ioo (0 : ℝ) 1 ∧
  F.subsetClosed ∧
  F.identityCondition ∧
  F.inversionCondition ∧
  F.productCondition

theorem fuzzy_subgroup_level_cut_closed_from_evidence
  {G : Type u} [Group G] (F : FuzzySubgroupLevelCutPackage G)
  (E : FuzzySubgroupLevelCutEvidence F) : FuzzySubgroupLevelCutClosed F := by
  exact And.intro E.levelClosed
    (And.intro E.subsetClosedClosed
      (And.intro E.identityConditionClosed
        (And.intro E.inversionConditionClosed E.productConditionClosed)))

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse