import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySylowPackage (G : FuzzySubgroupPackage) where
  group : G
  prime : ℕ
  maximalPrimePowerMembership : Prop
  conjugateExistence : Prop
  countCondition : Prop

structure FuzzySylowEvidence (S : FuzzySylowPackage) where
  maximalPrimePowerMembershipClosed : S.maximalPrimePowerMembership
  conjugateExistenceClosed : S.conjugateExistence
  countConditionClosed : S.countCondition

def FuzzySylowClosed (S : FuzzySylowPackage) : Prop :=
  S.maximalPrimePowerMembership ∧ S.conjugateExistence ∧ S.countCondition

theorem fuzzy_sylow_closed_from_evidence (S : FuzzySylowPackage) (E : FuzzySylowEvidence S) :
    FuzzySylowClosed S := by
  exact And.intro E.maximalPrimePowerMembershipClosed
    (And.intro E.conjugateExistenceClosed E.countConditionClosed)

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean