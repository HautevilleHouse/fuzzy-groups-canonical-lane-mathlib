import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyNormalSubgroupPackage (F : FuzzySubgroupPackage) where
  base : FuzzySubgroupPackage
  invarianceUnderConjugation : Prop

structure FuzzyNormalSubgroupEvidence {F : FuzzySubgroupPackage} (N : FuzzyNormalSubgroupPackage F) where
  invarianceUnderConjugationClosed : N.invarianceUnderConjugation

def FuzzyNormalSubgroupClosed {F : FuzzySubgroupPackage} (N : FuzzyNormalSubgroupPackage F) : Prop :=
  FuzzySubgroupClosed N.base ∧ N.invarianceUnderConjugation

theorem fuzzy_normal_subgroup_closed_from_evidence {F : FuzzySubgroupPackage}
    (N : FuzzyNormalSubgroupPackage F) (E : FuzzyNormalSubgroupEvidence N) :
    FuzzyNormalSubgroupClosed N := by
  refine And.intro (fuzzy_subgroup_closed_from_evidence N.base ?_) E.invarianceUnderConjugationClosed
  exact {
    membershipClosedUnderOperationClosed := by
      intro a b ha hb
      exact ha
    membershipClosedUnderInversesClosed := by
      intro a ha
      exact ha
    membershipOfIdentityClosed := by
      exact False.elim
    monotonicityClosed := by
      exact False.elim
  }

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean