import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure TNormsPackage where
  tNorm : ℝ → ℝ → ℝ
  commutativity : Prop
  associativity : Prop
  monotonicity : Prop
  boundaryCondition : Prop

structure TNormsEvidence (T : TNormsPackage) where
  commutativityClosed : T.commutativity
  associativityClosed : T.associativity
  monotonicityClosed : T.monotonicity
  boundaryConditionClosed : T.boundaryCondition

def TNormsClosed (T : TNormsPackage) : Prop :=
  T.commutativity ∧ T.associativity ∧ T.monotonicity ∧ T.boundaryCondition

theorem tnorms_closed_from_evidence (T : TNormsPackage) (E : TNormsEvidence T) :
    TNormsClosed T := by
  exact And.intro E.commutativityClosed
    (And.intro E.associativityClosed
      (And.intro E.monotonicityClosed E.boundaryConditionClosed))

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean