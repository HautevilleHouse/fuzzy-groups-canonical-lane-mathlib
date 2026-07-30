import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyGroupDefinition

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyGroupHomomorphism (G H : FuzzyGroup) where
  map : G.carrier → H.carrier
  preservesOperation : ∀ x y : G.carrier, map (operation G x y) = operation H (map x) (map y)
  preservesIdentity : map (identity G) = identity H
  preservesInverses : ∀ x : G.carrier, map (inverses G x) = inverses H (map x)
  membershipNondecreasing : ∀ x : G.carrier, H.membership (map x) ≥ G.membership x

theorem fuzzy_homomorphism_composition (G H K : FuzzyGroup) (f : FuzzyGroupHomomorphism G H) (g : FuzzyGroupHomomorphism H K) : FuzzyGroupHomomorphism G K :=
  { map := g.map ∘ f.map,
    preservesOperation := by
      intro x y
      calc
        (g.map ∘ f.map) (operation G x y) = g.map (f.map (operation G x y)) := rfl
        _ = g.map (operation H (f.map x) (f.map y)) := by rw [f.preservesOperation]
        _ = operation K (g.map (f.map x)) (g.map (f.map y)) := by rw [g.preservesOperation]
        _ = operation K ((g.map ∘ f.map) x) ((g.map ∘ f.map) y) := rfl
    preservesIdentity := by
      calc
        (g.map ∘ f.map) (identity G) = g.map (f.map (identity G)) := rfl
        _ = g.map (identity H) := by rw [f.preservesIdentity]
        _ = identity K := by rw [g.preservesIdentity]
    preservesInverses := by
      intro x
      calc
        (g.map ∘ f.map) (inverses G x) = g.map (f.map (inverses G x)) := rfl
        _ = g.map (inverses H (f.map x)) := by rw [f.preservesInverses]
        _ = inverses K (g.map (f.map x)) := by rw [g.preservesInverses]
        _ = inverses K ((g.map ∘ f.map) x) := rfl
    membershipNondecreasing := by
      intro x
      calc
        K.membership ((g.map ∘ f.map) x) = K.membership (g.map (f.map x)) := rfl
        _ ≥ H.membership (f.map x) := g.membershipNondecreasing (f.map x)
        _ ≥ G.membership x := f.membershipNondecreasing x
        _ = G.membership x := rfl
  }

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse