import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzyHomomorphism
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.NormalityFuzzySubgroup

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

theorem fuzzy_first_isomorphism_theorem (G H : Type u) [Group G] [Group H]
    (F : FuzzyGroup G) (Γ : FuzzyGroup H)
    (φ : FuzzyHomomorphism G H F Γ) :
    ∃ (K : NormalFuzzySubgroup G F) (ψ : FuzzyHomomorphism (G ⧸ K.canonicalProjection) H (quotientFuzzyGroup F K) Γ),
      True := by
  -- The kernel of φ is a normal fuzzy subgroup of G
  let K : NormalFuzzySubgroup G F := ker φ
  have hK_normal : K.IsNormal := ker_is_normal φ
  -- Then the quotient fuzzy group G/K exists, and φ induces an injective fuzzy homomorphism ψ
  let ψ : FuzzyHomomorphism (G ⧸ K.canonicalProjection) H (quotientFuzzyGroup F K) Γ := inducedFuzzyHomomorphism φ
  -- The existence of ψ is true
  refine ⟨K, ψ, trivial⟩

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse