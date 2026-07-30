import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyHomomorphism (G H : Type u) [Group G] [Group H] where
  map : G → H
  respectsMul : ∀ x y : G, map (x * y) = map x * map y
  membershipLe : ∀ x : G, (fuzzySet H).membership (map x) ≥ (fuzzySet G).membership x

structure FuzzyHomomorphismClosure (A : AdmissibleClass) where
  domain : AdmissibleFuzzyGroup ℤ
  codomain : AdmissibleFuzzyGroup ℤ
  hom : FuzzyHomomorphism ℤ ℤ
  bridgeClosure : bridgeClosed A
  gateClosure : gateClosed A

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse