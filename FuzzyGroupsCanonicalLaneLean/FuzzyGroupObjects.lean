import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzySet (X : Type u) where
  membership : X → ℝ
  membership_range : ∀ x, membership x ∈ Set.Icc (0 : ℝ) 1

structure FuzzyGroup (X : Type u) [inst : Group X] where
  carrier : FuzzySet X
  multiplication : X → X → X
  inverse : X → X
  product_membership : ∀ x y : X, carrier.membership (inst.mul x y) ≥ min (carrier.membership x) (carrier.membership y)
  inverse_membership : ∀ x : X, carrier.membership (inst.inv x) = carrier.membership x
  identity_membership : carrier.membership (inst.one : X) = 1

structure FuzzyAdmittedObject where
  group : Type
  groupGroup : Group group
  fuzzyGroup : FuzzyGroup group
  endoSatisfied : Prop
  remainderRecorded : Prop
  conclusion : endoSatisfied ∨ remainderRecorded

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse