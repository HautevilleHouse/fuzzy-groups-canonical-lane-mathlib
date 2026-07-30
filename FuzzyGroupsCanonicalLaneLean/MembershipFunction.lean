import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure MembershipFunction (X : Type u) where
  carrier : X → ℝ
  rangeInUnit : ∀ x, carrier x ∈ Set.Icc (0 : ℝ) 1

structure MembershipFunctionEvidence (X : Type u) (μ : MembershipFunction X) where
  rangeInUnitClosed : μ.rangeInUnit

def MembershipFunctionClosed (X : Type u) (μ : MembershipFunction X) : Prop :=
  ∀ x, μ.carrier x ∈ Set.Icc (0 : ℝ) 1

theorem membership_function_closed_from_evidence (X : Type u) (μ : MembershipFunction X) (E : MembershipFunctionEvidence X μ) : MembershipFunctionClosed X μ := by
  exact E.rangeInUnitClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse