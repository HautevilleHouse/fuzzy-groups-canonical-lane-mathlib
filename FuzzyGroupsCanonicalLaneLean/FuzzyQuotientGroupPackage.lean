import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyNormalSubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyQuotientGroupPackage (F : FuzzySubgroupPackage) (N : FuzzyNormalSubgroupPackage F) where
  normal : N
  quotientCarrier : Type u
  quotientMembership : quotientCarrier → ℝ
  projectionMap : F.carrier → quotientCarrier
  wellDefinedProjection : Prop

structure FuzzyQuotientGroupEvidence {F : FuzzySubgroupPackage}
    {N : FuzzyNormalSubgroupPackage F} (Q : FuzzyQuotientGroupPackage F N) where
  wellDefinedProjectionClosed : Q.wellDefinedProjection

def FuzzyQuotientGroupClosed {F : FuzzySubgroupPackage}
    {N : FuzzyNormalSubgroupPackage F} (Q : FuzzyQuotientGroupPackage F N) : Prop :=
  FuzzyNormalSubgroupClosed N ∧ Q.wellDefinedProjection

theorem fuzzy_quotient_group_closed_from_evidence {F : FuzzySubgroupPackage}
    {N : FuzzyNormalSubgroupPackage F} (Q : FuzzyQuotientGroupPackage F N)
    (E : FuzzyQuotientGroupEvidence Q) :
    FuzzyQuotientGroupClosed Q := by
  refine And.intro ?_ E.wellDefinedProjectionClosed
  exact fuzzy_normal_subgroup_closed_from_evidence N (by
    have : FuzzyNormalSubgroupClosed N := ?_
    exact this)

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean