import Mathlib

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySet (X : Type u) where
  membership : X → ℝ

structure FuzzyGroup (X : Type u) [Group X] where
  carrier : FuzzySet X
  multiplication : (x y : X) → carrier.membership (x * y) ≥ carrier.membership x * carrier.membership y
  inverse : (x : X) → carrier.membership x⁻¹ = carrier.membership x
  identity : carrier.membership 1 = 1

structure AdmissibleFuzzyGroup (G : Type u) [Group G] where
  group : G → G → G
  unit : G
  fset : FuzzySet G
  fgroup : FuzzyGroup G

structure AdmissibleClass where
  object : AdmissibleFuzzyGroup ℤ
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (∀ g : ℤ, A.object.fgroup.carrier.membership g ≤ 1) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse