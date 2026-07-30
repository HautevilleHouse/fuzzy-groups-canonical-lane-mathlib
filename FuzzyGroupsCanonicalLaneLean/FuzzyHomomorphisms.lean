import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroups

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyHomomorphism (G H : Type u) [Group G] [Group H] (F : FuzzySubgroup G) (K : FuzzySubgroup H) where
  map : G → H
  membershipPreserved : ∀ g : G, K.membershipFunction (map g) ≥ F.membershipFunction g
  mapRespectsGroup : ∀ g h : G, map (g * h) = map g * map h

structure FuzzyHomomorphismEvidence (G H : Type u) [Group G] [Group H] (F : FuzzySubgroup G) (K : FuzzySubgroup H) (φ : FuzzyHomomorphism G H F K) where
  membershipPreservedClosed : ∀ g : G, K.membershipFunction (φ.map g) ≥ F.membershipFunction g
  mapRespectsGroupClosed : ∀ g h : G, φ.map (g * h) = φ.map g * φ.map h

def FuzzyHomomorphismClosed (G H : Type u) [Group G] [Group H] (F : FuzzySubgroup G) (K : FuzzySubgroup H) (φ : FuzzyHomomorphism G H F K) : Prop :=
  (∀ g : G, K.membershipFunction (φ.map g) ≥ F.membershipFunction g) ∧
  (∀ g h : G, φ.map (g * h) = φ.map g * φ.map h)

theorem fuzzy_homomorphism_closed_from_evidence (G H : Type u) [Group G] [Group H] (F : FuzzySubgroup G) (K : FuzzySubgroup H) (φ : FuzzyHomomorphism G H F K) (E : FuzzyHomomorphismEvidence G H F K φ) : FuzzyHomomorphismClosed G H F K φ := by
  exact And.intro E.membershipPreservedClosed E.mapRespectsGroupClosed

structure FuzzyHomomorphismKernel (G H : Type u) [Group G] [Group H] (F : FuzzySubgroup G) (K : FuzzySubgroup H) (φ : FuzzyHomomorphism G H F K) where
  kernelFuzzySubgroup : FuzzySubgroup G
  kernelMembership : ∀ g : G, kernelFuzzySubgroup.membershipFunction g = if φ.map g = 1 then 1 else min (F.membershipFunction g) (K.membershipFunction (φ.map g))

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse
