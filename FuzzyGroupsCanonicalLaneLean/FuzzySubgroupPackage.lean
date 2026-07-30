import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySubgroupPackage where
  carrier : Type u
  membershipFunction : carrier → ℝ
  productCarrier : Type v
  operation : carrier → carrier → carrier
  identity : carrier
  inverses : carrier → carrier
  tNorm : ℝ → ℝ → ℝ
  membershipClosedUnderOperation : Prop
  membershipClosedUnderInverses : Prop
  membershipOfIdentity : Prop
  monotonicity : Prop

structure FuzzySubgroupEvidence (F : FuzzySubgroupPackage) where
  membershipClosedUnderOperationClosed : F.membershipClosedUnderOperation
  membershipClosedUnderInversesClosed : F.membershipClosedUnderInverses
  membershipOfIdentityClosed : F.membershipOfIdentity
  monotonicityClosed : F.monotonicity

def FuzzySubgroupClosed (F : FuzzySubgroupPackage) : Prop :=
  F.membershipClosedUnderOperation ∧ F.membershipClosedUnderInverses ∧
  F.membershipOfIdentity ∧ F.monotonicity

theorem fuzzy_subgroup_closed_from_evidence (F : FuzzySubgroupPackage) (E : FuzzySubgroupEvidence F) :
    FuzzySubgroupClosed F := by
  exact And.intro E.membershipClosedUnderOperationClosed
    (And.intro E.membershipClosedUnderInversesClosed
      (And.intro E.membershipOfIdentityClosed E.monotonicityClosed))

end HautevilleHouse
end FuzzyGroupsCanonicalLaneLean