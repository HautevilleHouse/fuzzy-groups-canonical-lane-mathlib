import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySet (X : Type u) where
  membership : X → ℝ
  membershipRange : ∀ x, membership x ∈ Set.Icc (0 : ℝ) 1

structure FuzzySetEvidence (X : Type u) (A : FuzzySet X) where
  membershipRangeClosed : ∀ x, A.membership x ∈ Set.Icc (0 : ℝ) 1

def FuzzySetClosed (X : Type u) (A : FuzzySet X) : Prop :=
  ∀ x, A.membership x ∈ Set.Icc (0 : ℝ) 1

theorem fuzzy_set_closed_from_evidence (X : Type u) (A : FuzzySet X)
    (E : FuzzySetEvidence X A) : FuzzySetClosed X A := by
  intro x
  exact E.membershipRangeClosed x

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse