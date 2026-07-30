import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyGroup where
  carrier : Type u
  membership : carrier → ℝ
  operation : carrier → carrier → carrier
  identity : carrier
  inverses : carrier → carrier
  membershipUnitInterval : ∀ x : carrier, 0 ≤ membership x ∧ membership x ≤ 1
  closure : ∀ x y : carrier, membership (operation x y) ≥ min (membership x) (membership y)
  associativity : ∀ x y z : carrier, operation (operation x y) z = operation x (operation y z)
  identityLaw : ∀ x : carrier, operation x identity = x ∧ operation identity x = x
  inversesLaw : ∀ x : carrier, operation x (inverses x) = identity ∧ operation (inverses x) x = identity

theorem fuzzy_group_membership_nonneg (G : FuzzyGroup) (x : G.carrier) : 0 ≤ G.membership x :=
  (G.membershipUnitInterval x).1

theorem fuzzy_group_membership_le_one (G : FuzzyGroup) (x : G.carrier) : G.membership x ≤ 1 :=
  (G.membershipUnitInterval x).2

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse